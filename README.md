import Foundation

class UploadManager {
    static let shared = UploadManager()
    
    var retryTimer: Timer?
    var isTimerActive: Bool = false
    var basePath: String
    var failedPath: String
    var completePath: String
    
    private init() {
        // Define paths for base, failed, and completed uploads
        basePath = NSTemporaryDirectory().appending("A")
        failedPath = basePath.appending("/failed")
        completePath = basePath.appending("/complete")
        
        // Ensure directories are created
        createDirectoryIfNeeded(at: basePath)
        createDirectoryIfNeeded(at: failedPath)
        createDirectoryIfNeeded(at: completePath)
    }
    
    private func createDirectoryIfNeeded(at path: String) {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) {
            try? fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func uploadTestResult(ticketID: String, testObject: TestObject) {
        // Write file to disk
        let filePath = basePath.appending("/\(ticketID).json")
        let data: [String: Any] = [
            "ticketID": ticketID,
            "uploadStatus": "pending",
            "timestamp": Date().timeIntervalSince1970
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted) {
            try? jsonData.write(to: URL(fileURLWithPath: filePath))
        }
        
        // Define upload progress and completion handlers
        let uploadProgressHandler: (Int) -> Void = { progress in
            print("Upload progress: \(progress)%")
        }
        
        let completionHandler: (Error?) -> Void = { error in
            if let error = error {
                print("Upload failed: \(error.localizedDescription)")
                self.moveFile(from: filePath, to: self.failedPath)
            } else {
                print("Upload succeeded")
                self.moveFile(from: filePath, to: self.completePath)
            }
        }
        
        // Trigger upload logic in the TestObject
        testObject.upload(ticketID: ticketID, progressHandler: uploadProgressHandler, completionHandler: completionHandler)
        
        // Start retry timer if not active
        startRetryTimer()
    }
    
    private func moveFile(from filePath: String, to destinationPath: String) {
        let destinationFilePath = destinationPath.appending("/\(filePath.lastPathComponent)")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: destinationFilePath) {
            try? fileManager.removeItem(atPath: destinationFilePath)
        }
        
        do {
            try fileManager.moveItem(atPath: filePath, toPath: destinationFilePath)
        } catch {
            print("Failed to move file: \(error.localizedDescription)")
        }
    }
    
    func startRetryTimer() {
        guard !isTimerActive else {
            print("Retry timer already active, no need to start again")
            return
        }
        isTimerActive = true
        retryTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(retryFailedUploads), userInfo: nil, repeats: true)
        print("Retry timer started")
    }
    
    func stopRetryTimer() {
        retryTimer?.invalidate()
        retryTimer = nil
        isTimerActive = false
        print("Retry timer stopped")
    }
    
    @objc private func retryFailedUploads() {
        let fileManager = FileManager.default
        let files = (try? fileManager.contentsOfDirectory(atPath: basePath)) ?? []
        
        // Check and move files older than 1 day to failed directory
        for fileName in files {
            let filePath = basePath.appending("/\(fileName)")
            if let attributes = try? fileManager.attributesOfItem(atPath: filePath),
               let creationDate = attributes[.creationDate] as? Date {
                let timeInterval = Date().timeIntervalSince(creationDate)
                if timeInterval > 24 * 60 * 60 { // Older than 1 day
                    moveFile(from: filePath, to: failedPath)
                }
            }
        }
        
        // Process failed files
        let failedFiles = (try? fileManager.contentsOfDirectory(atPath: failedPath)) ?? []
        for fileName in failedFiles {
            let filePath = failedPath.appending("/\(fileName)")
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
               let data = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
               let ticketID = data["ticketID"] as? String {
                let testObject = TestObject()
                uploadTestResult(ticketID: ticketID, testObject: testObject)
            }
        }
        
        // Stop timer if no files are left
        if failedFiles.isEmpty {
            stopRetryTimer()
        }
    }
}