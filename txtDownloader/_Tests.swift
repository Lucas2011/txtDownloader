import Foundation

class SafeTimer {
    static let shared = SafeTimer()

    private var timer: DispatchSourceTimer?
    private let lockQueue = DispatchQueue(label: "com.safetimer.lock")
    private let timerQueue = DispatchQueue(label: "com.safetimer.queue")
    
    private var interval: TimeInterval = 10
    
    private init() {}

   
    func start(interval: TimeInterval = 10, immediately: Bool = false) {
        lockQueue.async { [weak self] in
            guard let self = self else { return }
            if self.timer != nil { return }
            
            self.interval = interval
            
            if immediately {
                self.executeTask()
            }
            
            let timer = DispatchSource.makeTimerSource(queue: self.timerQueue)
            timer.schedule(deadline: .now() + interval, repeating: interval)
            
            timer.setEventHandler { [weak self] in
                self?.executeTask()
            }
            
            timer.resume()
            self.timer = timer
            print("✅ Timer started with interval: \(interval)s")
        }
    }
    
    
    func stop() {
        lockQueue.async { [weak self] in
            guard let self = self else { return }
            if let timer = self.timer {
                timer.cancel()
                self.timer = nil
                print("🛑 Timer stopped")
            }
        }
    }
    
  
    private func executeTask() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            do {
                try self.task()
            } catch {
                print("⚠️ Task error: \(error)")
            }
        }
    }
    
    
    private func task() throws {
        print("⏱ Task running at \(Date()) on thread: \(Thread.current)")
        Thread.sleep(forTimeInterval: 2) 
    }
}
