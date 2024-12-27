import Foundation

func compressFolder(at sourcePath: String, to destinationPath: String) -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/tar") // 使用 tar 命令

    // tar -czf destinationPath sourcePath
    process.arguments = ["-czf", destinationPath, "-C", sourcePath.deletingLastPathComponent(), sourcePath.lastPathComponent()]

    do {
        try process.run()
        process.waitUntilExit()

        if process.terminationStatus == 0 {
            print("压缩成功: \(destinationPath)")
            return destinationPath // 返回成功的路径
        } else {
            print("压缩失败，退出状态: \(process.terminationStatus)")
            return "" // 压缩失败返回空字符串
        }
    } catch {
        print("压缩过程中出错: \(error.localizedDescription)")
        return "" // 出错返回空字符串
    }
}

extension String {
    func deletingLastPathComponent() -> String {
        return (self as NSString).deletingLastPathComponent
    }

    func lastPathComponent() -> String {
        return (self as NSString).lastPathComponent
    }
}

// 示例路径
let sourcePath = "/path/A"
let destinationPath = "/path/ATimesample.tar.gz"

let result = compressFolder(at: sourcePath, to: destinationPath)
print("结果路径: \(result.isEmpty ? "压缩失败" : result)")