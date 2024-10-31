import Foundation

class TcpdumpManager {
    private var tcpdumpTasks: [Process] = []

    init() {
        // 初始化
    }

    func startTcpdumps() {
        for i in 0..<10 {
            let tcpdumpTask = Process()
            
            // 设置 sudo 和 tcpdump 命令
            tcpdumpTask.launchPath = "/usr/bin/sudo" // 使用 sudo
            tcpdumpTask.arguments = ["tcpdump", "-i", "ipsec1", "-s", "200", "-w", "pathA/ipsec_\(i).pcap"]

            // 重定向标准错误输出
            let errorPipe = Pipe()
            tcpdumpTask.standardError = errorPipe

            // 设置任务终止处理
            tcpdumpTask.terminationHandler = { [weak self, weak tcpdumpTask] _ in
                if let status = tcpdumpTask?.terminationStatus, status != 0 {
                    let errorHandle = errorPipe.fileHandleForReading
                    let errorData = errorHandle.availableData
                    if let errorString = String(data: errorData, encoding: .utf8) {
                        print("tcpdump task terminated with error: \(status)")
                        print("Error output: \(errorString)")
                    }
                }
                // 从数组中移除任务
                self?.tcpdumpTasks.removeAll(where: { $0 == tcpdumpTask })
            }

            // 启动 tcpdump 任务
            tcpdumpTask.launch()
            tcpdumpTasks.append(tcpdumpTask)

            // 读取错误输出到日志文件
            DispatchQueue.global(qos: .default).async {
                let errorHandle = errorPipe.fileHandleForReading
                var data: Data?
                let logFilePath = "pathA/ipsec_\(i)_stderr.log"
                let fileManager = FileManager.default
                
                // 确保日志文件存在
                if !fileManager.fileExists(atPath: logFilePath) {
                    fileManager.createFile(atPath: logFilePath, contents: nil, attributes: nil)
                }
                
                if let logFileHandle = FileHandle(forWritingAtPath: logFilePath) {
                    while (data = errorHandle.availableData), data?.count ?? 0 > 0 {
                        if let errorString = String(data: data!, encoding: .utf8) {
                            logFileHandle.seekToEndOfFile()
                            logFileHandle.write(errorString.data(using: .utf8)!)
                        }
                    }
                    logFileHandle.closeFile()
                }
            }
        }
    }

    func stopTcpdumps() {
        for task in tcpdumpTasks {
            task.terminate() // 停止每个 tcpdump 任务
        }
        
        // 清空任务数组
        tcpdumpTasks.removeAll() // 可选地释放 Process 实例
    }
}

// 程序入口
let manager = TcpdumpManager()
manager.startTcpdumps()

// 等待用户输入以停止
print("Press Enter to stop tcpdump tasks...")
_ = readLine()

manager.stopTcpdumps()
print("Stopped tcpdump tasks.")