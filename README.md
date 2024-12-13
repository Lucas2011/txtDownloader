import Foundation

// 将日期字符串转换为Unix时间戳
func dateToUnixTimestamp(dateString: String) -> TimeInterval? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let date = dateFormatter.date(from: dateString) {
        return date.timeIntervalSince1970
    }
    return nil
}

// 逐行读取文件并检测时间戳间隔
func checkTimeStampGaps(in filePath: String) {
    do {
        let fileHandle = try FileHandle(forReadingAtPath: filePath)
        guard let fileHandle = fileHandle else {
            print("无法打开文件")
            return
        }
        
        var previousTimestamp: TimeInterval?
        var previousTimeString: String?
        
        while let line = try fileHandle.readLine() {
            let components = line.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
            
            // 确保文件格式正确，并且提取时间戳
            if components.count > 1, let timestamp = dateToUnixTimestamp(dateString: String(components[0] + " " + components[1])) {
                if let prevTimestamp = previousTimestamp, timestamp - prevTimestamp > 5 {
                    // 如果时间戳间隔超过5秒，输出间隔信息
                    if let prevTimeString = previousTimeString {
                        print("Gap detected: \(prevTimeString) -> \(line.split(separator: " ", maxSplits: 2)[0] + " " + line.split(separator: " ", maxSplits: 2)[1]) (Gap: \(timestamp - prevTimestamp) seconds)")
                    }
                }
                previousTimestamp = timestamp
                previousTimeString = String(components[0] + " " + components[1])
            }
        }
        
        fileHandle.closeFile()
    } catch {
        print("文件读取错误: \(error)")
    }
}

// 扩展 FileHandle 以支持逐行读取
extension FileHandle {
    func readLine() throws -> String? {
        var line = Data()
        while true {
            let byte = try self.read(upToCount: 1)
            if let byte = byte {
                if byte == 10 || byte == 13 { // 新行字符
                    break
                }
                line.append(byte)
            } else {
                break
            }
        }
        return line.isEmpty ? nil : String(data: line, encoding: .utf8)
    }
}

// 调用方法
let filePath = "/path/to/your/log.txt"
checkTimeStampGaps(in: filePath)