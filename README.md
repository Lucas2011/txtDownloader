import Foundation

// Create a DispatchQueue to manage log writing operations
let logQueue = DispatchQueue(label: "com.yourapp.logQueue", qos: .background)

let logFileName = "app.log"
let logDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let logFileURL = logDirectory.appendingPathComponent(logFileName)

// Lock for file writing to ensure thread safety
let fileLock = NSLock()

// Helper function to format the current date
func getCurrentTimestamp() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Set the desired format
    return formatter.string(from: Date())
}

func SwiftLog(file: String = #file, line: Int = #line, function: String = #function, _ formattedString: String) {
    // Prepare the log message with the current date, file, line, function, and formatted string
    let timestamp = getCurrentTimestamp()
    let logMessage = "[\(timestamp)] \(file):\(line) \(function) - \(formattedString)\n"
    
    logQueue.async {
        // Ensure the log writing is thread-safe by locking the file writing process
        fileLock.lock()
        
        defer {
            fileLock.unlock() // Unlock the file writing process after it's done
        }

        do {
            // If the log file doesn't exist, create a new empty file
            if !FileManager.default.fileExists(atPath: logFileURL.path) {
                FileManager.default.createFile(atPath: logFileURL.path, contents: nil, attributes: nil)
            }

            // Append the log message to the end of the file
            let fileHandle = try FileHandle(forWritingTo: logFileURL)
            fileHandle.seekToEndOfFile() // Move the pointer to the end of the file
            if let data = logMessage.data(using: .utf8) {
                fileHandle.write(data) // Write the log message to the file
            }
            fileHandle.closeFile() // Close the file after writing

        } catch {
            print("Failed to write to log file: \(error)") // Handle any errors during the file writing process
        }
    }
}