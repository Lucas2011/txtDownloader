
1. 初级/入门级：Swift 语法与 ARC 基础
Junior / Entry Level: Swift Syntax & ARC Basics
Target: 20–25 Questions Focus: Proving you understand how the language works, not just how to write it.

核心语法与类型系统
Core Syntax & Type System

[X] 1. 值类型与引用类型：解释 struct 和 class 在内存（栈与堆）方面的区别。2026 年你会何时选择 class 而非 struct？
Value vs. Reference Types: Explain the difference between struct and class in terms of memory (Stack vs. Heap). When would you use a class over a struct in 2026?

[X] 2. guard 与 if let：除了代码风格，guard 是如何强制“提前退出”的？Swift 5.7 引入的 if let x 简写是如何工作的？
guard vs. if let: Besides style, how does guard enforce "early exit"? How does the if let x (shorthand) introduced in Swift 5.7 work?

[X] 3. 可选型的底层实现：Optional 的本质是什么？（期望提到 enum Optional<Wrapped>）。你能否在不使用 if let 的情况下写一个 switch 语句来解包可选型？
Optionals Under the Hood: What actually is an Optional? (Expect mention of enum Optional<Wrapped>). Can you write a switch statement to unwrap an optional without if let?

[X] 4. 协议扩展：它们是如何实现“默认实现”的？使用 extension 组织代码的优势。
Protocol Extensions: How do they allow for "default implementations"? usage of extension to organize code.

[X] 5. 访问控制：区分 fileprivate、private 和 internal。为什么 private(set) 对整洁架构很有用？
Access Control: Differentiate between fileprivate, private, and internal. Why is private(set) useful for clean architecture?

[X] 6. 计算属性与存储属性：属性在什么时候是计算型的？计算属性是否占用内存存储？
Computed vs. Stored Properties: When is a property computed? Does a computed property take up memory storage?

[X] 7. defer 语句：多个 defer 块的执行顺序是怎样的？（后进先出）。为什么这对于资源清理很有用？
defer Statement: In what order do multiple defer blocks execute? (LIFO). Why is this useful for resource cleanup?

[X] 8. 闭包：什么是“尾随闭包”？@escaping（逃逸）和非逃逸闭包之间有什么区别？
Closures: What is a "trailing closure"? What is the difference between @escaping and non-escaping closures?

[X] 9. 带有关联值的枚举：它们与“原始值”有何不同？举一个建模应用状态（如 .loading, .success(Data), .error(Error)）的用例。
Enums with Associated Values: How do they differ from "Raw Values"? Give a use case for modeling app state (e.g., .loading, .success(Data), .error(Error)).

[X] 10. 类型别名：typealias 如何提高代码可读性，特别是在处理复杂的闭包签名时？
Type Aliases: How can typealias make your code more readable, especially with complex closure signatures?

内存管理 - ARC 基础
Memory Management (ARC Basics)

[X] 1. ARC 机制：ARC 是在编译时还是运行时运行？（编译时插入 retain/release）。
ARC Mechanics: Does ARC run at compile time or runtime? (Compile time insertion of retain/release).

[X] 2. 强引用与弱引用：为什么弱引用必须始终是可选类型的变量？
Strong vs. Weak: Why does a weak reference always have to be an Optional var?

[X] 3. 无主引用：什么时候使用 unowned 是安全的？如果你在对象释放后访问无主引用会发生什么？（崩溃）。
Unowned: When is it safe to use unowned? What happens if you access an unowned reference after the object is deallocated? (Crash).

[X] 4. 循环引用：描述一个 View Controller 和 ViewModel（或代理）之间典型的循环引用场景。
Retain Cycles: Describe a classic retain cycle scenario between a View Controller and a ViewModel (or Delegate).

[X] 5. 捕获列表：解释闭包中的 [weak self]。如果你在网络回调中不使用它会发生什么？
Capture Lists: Explain [weak self] in a closure. What happens if you don't use it in a network callback?

[X] 6. 集合类型：Swift 数组是值类型还是引用类型？当你向函数传递一个巨大的数组时会发生什么？（写时复制）。
Collection Types: Are Swift Arrays value types or reference types? What happens when you pass a huge array to a function? (Copy-on-Write).

现代 Swift 趋势基础 - 入门级
Modern Swift "Trend" Basics (Entry Level)

[X] 1. Codable：如何处理与属性名不匹配的 JSON 键（CodingKeys）？
Codable: How do you handle a JSON key that doesn't match your property name (CodingKeys)?

[X] 2. Result 类型：与 throwing 函数相比，Result<Success, Failure> 如何改进错误处理？
Result Type: How does Result<Success, Failure> improve error handling compared to throwing functions?

[X] 3. some 关键字：什么是“不透明类型”？为什么我们在 SwiftUI 中经常看到 some View？
some keyword: What is an "Opaque Type"? Why do we see some View in SwiftUI?

[X] 4. 错误处理：try、try? 和 try! 之间有什么区别？
Error Handling: What is the difference between try, try?, and try!?

[X] 5. 扩展：能否通过扩展向类添加存储属性？（不能）。为什么？
Extensions: Can you add a stored property to a class via an extension? (No). Why?

2. 中级：GCD 与并发
Mid-Level: GCD & Concurrency
Target: 35–40 Questions Focus: Bridging the gap between legacy GCD codebases and modern Swift Concurrency (Swift 6).

GCD - 遗留但必备
Grand Central Dispatch (Legacy but Required)

[X] 1. 同步与异步：如果在主线程调用 DispatchQueue.main.sync 会发生什么？（死锁）。为什么？
Sync vs. Async: What happens if you call DispatchQueue.main.sync from the main thread? (Deadlock). Why?

[X] 2. 服务质量：解释 .userInteractive, .userInitiated, .utility 和 .background 之间的区别。系统如何确定它们的优先级？
QoS (Quality of Service): Explain the difference between .userInteractive, .userInitiated, .utility, and .background. How does the OS prioritize these?

[X] 3. 调度组：如何使用 GCD 等待 3 个不同的 API 调用完成后再更新 UI？
DispatchGroups: How would you wait for 3 distinct API calls to finish before updating the UI using GCD?

[X] 4. 信号量：什么是 DispatchSemaphore？为什么在主线程使用它等待异步任务很危险？
Semaphores: What is a DispatchSemaphore? Why is it dangerous to use it to wait for an async task on the main thread?

[X] 5. 栅栏：如何使用 DispatchQueue 并发队列和 barrier 实现线程安全的读写模式？
Barriers: How do you implement a thread-safe reader/writer pattern using DispatchQueue concurrent queues and barriers?

[X] 6. 调度工作项：如何在 GCD 中取消任务？（你可以取消工作项，但如果任务已经开始执行，它不会停止）。
DispatchWorkItem: How can you cancel a task in GCD? (You can cancel the item, but it doesn't stop execution if already started).

现代 Swift 并发 - async/await
Modern Swift Concurrency (async/await)

[X] 1. 挂起点：await 到底发生了什么？线程会阻塞吗？（不，它会出让控制权）。
The Suspension Point: What actually happens at await? Does the thread block? (No, it yields).

[X] 2. 结构化并发：什么是“子任务”关系？如果父任务被取消，子任务会发生什么？
Structured Concurrency: What is the "child task" relationship? If a parent task is cancelled, what happens to the children?

[X] 3. 异步 let：async let 如何实现并行执行？它与顺序等待两个函数有何不同？
async let: How does async let allow for parallel execution? How does it differ from simply awaiting two functions sequentially?

[X] 4. 任务优先级：Swift 并发如何处理优先级继承？
Task Priorities: How does Swift Concurrency handle priority inheritance?

[X] 5. 分离任务：什么时候应该使用分离任务（Task.detached）而不是标准的 Task { }？（除非必要否则应避免，因为它会破坏上下文继承）。
Task.detached: When should you use a detached task versus a standard Task { }? (Avoid unless necessary, breaks context inheritance).

[X] 6. 主执行者：为什么我们要给 ViewModel 标注 @MainActor？如果后台任务尝试更新 MainActor 类中的属性会发生什么？
MainActor: Why do we annotate ViewModels with @MainActor? What happens if a background task tries to update a property on a MainActor class?

[X] 7. 延续性：如何将基于代理的遗留 API（如 CoreLocation）封装到异步流中？（使用 withCheckedContinuation）。
Continuation: How do you wrap a legacy delegate-based API (like CoreLocation) into an async stream? (withCheckedContinuation).

Actors 与安全
Actors & Safety

[X] 1. Actor 隔离：Actor 是如何防止数据竞争的？它是锁吗？（它是一个序列化器）。
Actor Isolation: How does an actor prevent data races? Is it a lock? (It's a serializer).

[X] 2. 重入性：如果一个 Actor 函数在 await 处暂停，其他任务可以进入该 Actor 吗？（可以）。你如何处理暂停期间的状态变化？
Reentrancy: If an actor function pauses at an await, can another task enter that actor? (Yes). How do you handle state changes during that pause?

[X] 3. 非隔离：什么时候会将 Actor 内部的属性或函数标记为 nonisolated？
nonisolated: When would you mark a property or function inside an actor as nonisolated?

[X] 4. Sendable 协议：哪些类型是隐式 Sendable 的？为什么标准类不是 Sendable 的？
Sendable Protocol: What types are implicitly Sendable? Why is a standard class not Sendable?

[X] 5. @unchecked Sendable：什么时候可以绕过编译器的安全检查？
@unchecked Sendable: When is it acceptable to bypass the compiler's safety checks?

高级 / 坑点 - 中级深度
Advanced / Pitfalls (Mid-Level Depth)

[X] 1. 线程爆炸：为什么创建 100 个 DispatchQueue 很糟糕，但创建 1000 个 Task 通常没问题？
Thread Explosion: Why is creating 100 DispatchQueues bad, but creating 1000 Tasks generally okay?

[X] 2. 协作线程池：Swift 并发使用多少个线程？（大致等于核心数量）。
Cooperative Thread Pool: How many threads does Swift Concurrency use? (Roughly equal to number of cores).

[X] 3. 竞态条件：在使用 async/await 时仍可能出现竞态条件吗？（是的，逻辑竞态 vs 数据竞态）。
Race Conditions: Can you still have a race condition with async/await? (Yes, logic races vs data races).

[X] 4. 任务让步：什么时候可能需要手动让出一个长时间运行的任务？
Task.yield(): When might you manually yield a long-running task?

[X] 5. 异步序列：如何遍历数据流（如通知或 WebSocket）？
AsyncSequence: How do you iterate over a stream of data (e.g., Notifications or WebSockets)?

[X] 6. 全局 Actor：除了主线程，@GlobalActor 属性在什么场景下有用？（例如 DatabaseActor）。
Global Actors: What is the @GlobalActor attribute useful for besides the Main thread? (e.g., a DatabaseActor).

3. 中级：设计模式
Mid-Level: Design Patterns
Focus: Moving beyond MVC into scalable architectures.

架构模式
Architectural Patterns

[X] 1. MVVM (Model-View-ViewModel):
    * 趋势：MVVM 在 SwiftUI 中有何变化？（使用 Observable 宏对比 Bindings）。
    Trend: How does MVVM change with SwiftUI? (Use of Observable macros vs Bindings).
    * 输入/输出：如何构建 ViewModel 以严格定义输入（用户意图）和输出（状态）？
    Input/Output: How do you structure a ViewModel to strictly define Inputs (User Intents) and Outputs (State)?

[X] 2. 协调者模式：
    * 原因：这如何解决“庞大的视图控制器”导航问题？
    Why: How does this solve the "Massive View Controller" navigation problem?
    * SwiftUI：协调者模式在 SwiftUI 中过时了吗？（没有，通常被 NavigationStack 路由替换或增强）。
    SwiftUI: Is the Coordinator pattern dead in SwiftUI? (No, often replaced/augmented by NavigationStack routers).

[X] 3. 单例（反模式？）：
    * 用法：什么时候单例是可以接受的（如 URLSession.shared），什么时候它是负担（测试）？
    Usage: When is a Singleton acceptable (e.g., URLSession.shared) vs. when is it a liability (Testing)?
    * 优化：如何重构单例以支持依赖注入？
    Fix: How do you refactor a Singleton to allow for Dependency Injection?
    
创建型与结构型模式
Creational & Structural Patterns

[X] 1. 工厂模式：在使用“面向协议编程”时，这有何帮助？（隐藏具体类型）。
Factory Pattern: How does this help when using "Protocol Oriented Programming"? (Hiding concrete types).

[X] 2. 建造者模式：我们在 Swift 的哪些地方能看到这种模式？（SwiftUI 的 ViewBuilder 和声明式语法）。
Builder Pattern: Where do we see this in Swift? (SwiftUI ViewBuilder and declarative syntax).

[X] 3. 装饰器/包装器：Swift 的属性包装器（@State, @Published）是如何充当装饰器模式的？
Decorator / Wrapper: How do Swift Property Wrappers (@State, @Published) act as a Decorator pattern?

[X] 4. 外观模式：如何使用外观模式来隐藏复杂的遗留 C++ 库或 Core Audio 设置？
Facade: How would you use a Facade to hide a complex legacy C++ library or Core Audio setup?

行为型模式
Behavioral Patterns

[X] 1. 观察者模式：比较 KVO（旧）、NotificationCenter（松耦合）、Combine（响应式）和 Swift Observation（宏）。在 1 对多通信中你选择哪种？
Observer Pattern: Compare KVO (old), NotificationCenter (loose), Combine (functional), and Swift Observation (macro). Which one do you use for 1-to-many communication?

[X] 2. 代理模式：为什么在许多 Apple 框架中，代理模式（1 对 1）仍优于闭包？（性能、避免循环引用、清晰的分离）。
Delegate Pattern: Why is the Delegate pattern (1-to-1) still preferred over Closures in many Apple frameworks (e.g., UITableViewDelegate)? (Performance, avoiding retain cycles, clean separation).

[X] 3. 依赖注入 (DI):
    * 技术：构造函数注入 vs 属性注入。
    Techniques: Constructor Injection vs. Property Injection.
    * 容器：你需要像 Swinject 这样的库吗，还是可以自己构建一个简单的 DI 容器？
    Container: Do you need a library (like Swinject) or can you build a simple DI Container?

4. 高级：高级主题与 2026 趋势
Senior Level: Advanced Topics & 2026 Trends
Focus: Swift 6 Concurrency, System Design, SwiftUI Architecture, and Quality Engineering.

高级并发与线程安全
Advanced Concurrency & Thread Safety

[X] 1. 基于区域的隔离：解释 Swift 6 中的“基于区域的隔离”。编译器如何证明在不使用锁的情况下跨线程传递非 Sendable 值是安全的？
Region-based Isolation: Explain "Region-based Isolation" in Swift 6. How does the compiler prove that passing a non-Sendable value between threads is safe without using locks?

[X] 2. 迁移工具：@preconcurrency import 和 @Sendable 有什么区别？在代码库迁移期间具体应何时使用它们？
Migration Tools: What is the difference between @preconcurrency import and @Sendable? When exactly should you use each during a codebase migration?

[X] 3. 所有权转移：函数签名中的 sending（或 transferring）关键字如何工作？它如何允许你将非 Sendable 类实例移动到 Actor 中？
Ownership Transfer: How does the sending (or transferring) keyword work in function signatures? How does it allow you to move a non-Sendable class instance into an Actor?

[X] 4. 编译时安全：举一个在 Swift 5.10 中运行正常但在 Swift 6 中触发“数据竞争”编译错误的例子。编译器具体捕获了什么？
Compile-time Safety: Give an example of code that runs fine in Swift 5.10 but triggers a "Data Race" compile error in Swift 6. What specifically is the compiler catching?

[X] 5. 现代锁：在高性能 Swift 代码中，NSLock 被认为是过时的。什么是 OSAllocatedUnfairLock？为什么在保护小型、频繁访问的状态（如计数器）时，它比 Actor 更受青睐？
Modern Locks: NSLock is considered legacy for high-performance Swift code. What is OSAllocatedUnfairLock, and why is it preferred over Actors for protecting small, frequently accessed state (like a counter)?

[X] 6. 上下文切换成本：比较 Actor 的 await（挂起）与低级互斥锁/锁（阻塞）的运行时开销。在 120Hz 渲染等高频循环中，为什么 Actor 可能会导致“掉帧”？
Context Switch Cost: Compare the runtime overhead of an Actor's await (suspension) versus a low-level Mutex/Lock (blocking). In a high-frequency loop (e.g., 120Hz rendering), why might an Actor introduce "frame drops"?

[X] 7. 重入处理：Actor 是可重入的。解释一种“Actor 重入”导致逻辑竞态条件（状态滑移）的情况。如何在不阻塞线程的情况下防止这种情况？
Reentrancy Handling: Actors are reentrant. Explain a scenario where "Actor Reentrancy" leads to a logical race condition (State Slip). How do you prevent this without blocking the thread?

[X] 8. 协作线程池：Swift 并发的“协作线程池”与 GCD 的“并发队列”有何不同？为什么 GCD 会出现“线程爆炸”而 Swift 并发不会？
Cooperative Thread Pool: How does Swift Concurrency's "Cooperative Thread Pool" differ from GCD's "Concurrent Queues"? Why does GCD suffer from "Thread Explosion" while Swift Concurrency does not?

[X] 9. 自定义执行器：什么时候需要实现自定义的 TaskExecutor？举一个真实世界的例子（例如，将数据库操作隔离到特定线程）。
Custom Executors: When would you need to implement a custom TaskExecutor (Swift 5.9+)? Give a real-world example (e.g., isolating Database operations to a specific thread).

[X] 10. 优先级反转：当高优先级任务等待由低优先级任务持有的 Actor 时，Swift 运行时如何处理“优先级反转”？
Priority Inversion: How does the Swift Runtime handle "Priority Inversion" when a high-priority task is waiting on an Actor held by a low-priority task?

高级 SwiftUI 与性能
Advanced SwiftUI & Performance

[X] 1. 标识符：解释 SwiftUI 中显式标识符（id(...)）和结构标识符的区别。改变视图层级（如使用 if-else 对比 opacity）如何影响标识符和状态持久化？
Identity: Explain the difference between Explicit Identity (id(...)) and Structural Identity in SwiftUI. How does changing the view hierarchy (e.g., using if-else vs. opacity) affect the identity and state persistence?

[X] 2. 依赖图：SwiftUI 的属性图（Attribute Graph）如何检测变化？为什么在 body 属性中直接进行大量计算是不好的做法？
Dependency Graph: How does SwiftUI’s Attribute Graph detect changes? Why is it bad practice to perform heavy computations directly inside the body property?

[X] 3. 状态管理演进：在 Swift 6 中，为什么 @StateObject 被视为过时？新的 Observation 框架（@Observable 宏）如何通过减少不必要的视图更新来提高性能？
State Management Evolution: In Swift 6, why is @StateObject considered legacy? How does the new Observation framework (@Observable macro) improve performance by reducing unnecessary view updates?

[X] 4. 布局协议：如何使用 Layout 协议实现自定义的流式布局或瀑布流布局？它与使用 GeometryReader 有何不同？
Layout Protocol: How would you implement a custom FlowLayout or MasonryLayout using the Layout protocol? How is it different from using a GeometryReader?

[X] 5. GeometryReader 的坑：为什么 GeometryReader 常被称为“布局破坏者”？在列表单元格中使用它对性能有什么影响？
GeometryReader Pitfalls: Why is GeometryReader often considered a "layout breaker"? What are the performance implications of using it in a list cell?

[X] 6. 动画性能：解释 withAnimation 和 .animation(_:value:) 的区别。如何使用 Instruments 调试复杂 SwiftUI 动画中的“卡顿”（掉帧）？
Animation Performance: Explain the difference between withAnimation and .animation(_:value:). How do you debug a "hitch" (dropped frame) in a complex SwiftUI animation using Instruments?

[X] 7. 绘图组：什么时候应该使用 .drawingGroup()（Metal 离屏渲染）？为什么不默认对所有视图开启？
Drawing Group: When should you use .drawingGroup() (Metal offscreen rendering)? Why isn't it enabled by default for all views?

[X] 8. 环境开销：在根级别向 .environment() 注入大型对象是否有性能成本？它如何影响那些不读取该数据的下游视图？
Environment Overhead: Is there a performance cost to injecting a large object into .environment() at the root level? How does it affect downstream views that don't read that data?

[X] 9. 导航栈：在模块化应用中，如何使用 NavigationStack 和 NavigationPath 处理深度链接和编程式导航？
NavigationStack: How do you handle deep linking and programmatic navigation in a modularized app using NavigationStack and NavigationPath?

[X] 10. UIKit 互操作：在使用 UIViewControllerRepresentable 将复杂的 UIViewController（如相机或地图）嵌入 SwiftUI 视图时，如何处理生命周期不匹配的问题？
UIKit Interop: How do you handle the lifecycle mismatch when embedding a complex UIViewController (e.g., Camera or Map) inside a SwiftUI view using UIViewControllerRepresentable?

移动系统设计
Mobile System Design

[X] 1. 冲突解决：为协作笔记应用设计一个同步引擎。当两个用户在离线状态下编辑同一条笔记时，你如何处理“写入冲突”？（关键词：CRDTs, 最后写入者胜, 向量时钟）。
Conflict Resolution: Design a sync engine for a collaborative note-taking app. How would you handle a "Write Conflict" when two users edit the same note offline? (Expected keywords: CRDTs, Last-Write-Wins, Vector Clocks).

[X] 2. 数据库选择：比较高并发聊天应用中 SwiftData、SQLite (GRDB) 和 Realm 的优劣。在特定场景下，资深工程师为什么可能选择原始 SQLite 而非 Core Data/SwiftData？
Database Choice: Compare SwiftData vs. SQLite (GRDB) vs. Realm for a high-concurrency chat app. Why might a Senior Engineer choose raw SQLite over Core Data/SwiftData in specific scenarios?

[X] 3. 图片缓存系统：设计一个自定义图片加载库。如何实现 LRU（最近最少使用）缓存淘汰？如何处理“惊群效应”（针对同一 URL 的重复请求）？
Image Caching System: Design a custom image loading library. How do you implement LRU (Least Recently Used) cache eviction? How do you handle "Thundering Herd" (duplicate requests for the same URL)?

[X] 4. 弹性：如何以优雅的方式实现失败网络请求重试的“指数退避”和“抖动”策略？

[X] 5. 功能模块：如何组织一个拥有 50 多名工程师的项目？解释接口模块（API）和实现模块之间的区别。这如何缩短编译时间？
Feature Modules: How do you structure a project with 50+ engineers? Explain the difference between Interface Modules (API) and Implementation Modules. How does this reduce build time?

[X] 6. 依赖注入：在多模块应用中，如何在功能模块不了解主应用的情况下向其注入依赖？（依赖倒置）。
Dependency Injection: In a multi-module app, how do you inject dependencies into a Feature Module without that module knowing about the main app? (Dependency Inversion).

测试与质量工程
Testing & Quality Engineering

[X] 1. 并发测试：如何对 Actor 或 async/await 函数进行单元测试？MainActor.assumeIsolated 在测试中有什么作用？
Concurrency Testing: How do you unit test an actor or an async/await function? How does MainActor.assumeIsolated help in tests?

[X] 2. 快照测试：快照测试（如 Point-Free 的库）的优缺点是什么？如何处理由不同屏幕尺寸或系统版本引起的“不稳定性”？
Snapshot Testing: What are the pros and cons of Snapshot Testing (e.g., Point-Free's library)? How do you handle "flakiness" caused by different screen sizes or OS versions?

[X] 3. UI 测试：如何设计对 UI 变化具有弹性的 UI 测试？（例如，使用无障碍标识符对比文本匹配）。
UI Testing: How do you design UI Tests that are resilient to UI changes? (e.g., using accessibility identifiers vs. text matching).

[X] 4. 性能分析：除了“Leaks”，你还使用哪些 Instruments 工具？如何使用“Swift Concurrency”模板来可视化 Actor 争用？
Instruments: Apart from "Leaks", what other Instruments do you use? How do you use the "Swift Concurrency" template to visualize actor contention?

[X] 5. MetricKit：如何使用 MetricKit 监控线上用户的崩溃和“悬挂率”（主线程卡死）？
MetricKit: How would you use MetricKit to monitor production crashes and "Hang Rates" (ANRs) for real users?

5. Combine 框架
Combine Framework
Focus: Reactive programming with Combine, integration with SwiftUI and MVVM.

[] 1. Combine 核心概念：什么是 Publisher 和 Subscriber？它们是如何通过 .sink 和 .assign 连接的？
Combine Core Concepts: What are Publisher and Subscriber? How do they connect via .sink and .assign?

[] 2. Combine 管道与操作符：如何使用 filter、map、debounce 等操作符构建声明式数据流转换管道？
Combine Pipelines & Operators: How do you build declarative data stream transformation pipelines using operators like filter, map, and debounce?

[] 3. Combine 中的错误处理：如何在 Combine 中使用 .catch、.retry 和 .replaceError 进行优雅的错误处理？
Error Handling in Combine: How do you use .catch, .retry, and .replaceError for graceful error handling in Combine?

[] 4. AnyPublisher 类型擦除：为什么在网络层或 ViewModel 的 API 边界使用 AnyPublisher 来隐藏实现细节？
AnyPublisher Type Erasure: Why use AnyPublisher to hide implementation details at network layer or ViewModel API boundaries?

[] 5. Combine 内存管理与生命周期：AnyCancellable 和 Set<AnyCancellable> 如何管理订阅的保持与取消？
Combine Memory Management: How do AnyCancellable and Set<AnyCancellable> manage subscription retention and cancellation?

[] 6. Combine 在 MVVM 中的应用：如何使用 @Published 和 ObservableObject 实现状态绑定？
Combine in MVVM: How do you use @Published and ObservableObject for state binding?

[] 7. Combine vs Delegation vs Closures：在异步模式选型中，三者的组合性和耦合度有何权衡？
Combine vs Delegation vs Closures: What are the trade-offs in composability and coupling when choosing between these async patterns?

[] 8. Combine vs async/await：持续数据流（Combine）和一次性异步调用（async/await）各自适用什么场景？如何通过 AsyncPublisher 互转？
Combine vs async/await: When to use continuous streams (Combine) vs one-shot async calls (async/await)? How do you convert between them via AsyncPublisher?

6. Swift 语言进阶
Swift Language Advanced Topics
Focus: Deeper Swift language features and type system understanding.

[] 1. Swift Closure vs Objective-C Block：比较两者在语法、内存管理（__weak/__block vs [weak self]）、类型系统和运行时行为上的区别。
Swift Closure vs Objective-C Block: Compare differences in syntax, memory management (__weak/__block vs [weak self]), type system, and runtime behavior.

[] 2. @autoclosure：什么是 @autoclosure？它如何实现延迟求值？在断言和日志中有什么应用？
@autoclosure: What is @autoclosure? How does it enable lazy evaluation? What are its applications in assertions and logging?

[] 3. some vs any 关键字：对比 some（不透明类型，静态分发）和 any（存在式类型，动态分发）的区别。何时选择哪个？
some vs any Keywords: Compare some (opaque type, static dispatch) vs any (existential type, dynamic dispatch). When to choose which?

[] 4. Protocol Associated Types vs Enum Associated Values：编译时泛型占位符（associatedtype）和运行时数据载荷（Payload）的本质区别是什么？
Protocol Associated Types vs Enum Associated Values: What is the fundamental difference between compile-time generic placeholders (associatedtype) and runtime data payloads?

[] 5. Protocol vs Enum 本质区别：作为行为蓝图/开放系统（Protocol）和有限互斥状态集/封闭系统（Enum），两者在架构选型中如何抉择？
Protocol vs Enum: As a behavioral blueprint/open system (Protocol) vs finite mutually exclusive state set/closed system (Enum), how do you choose between them in architecture?

[] 6. Swift 泛型 vs Java 泛型：Swift 运行时具体化 + 特化（Monomorphization）与 Java 类型擦除的底层实现有何不同？
Swift Generics vs Java Generics: How do Swift's runtime reification + specialization (Monomorphization) differ from Java's type erasure implementation?

[] 7. Swift 集合类型安全：如何通过严格泛型、带关联值枚举、any Protocol 和 Any 类型擦除来保障集合的类型安全？
Swift Collection Type Safety: How do you ensure collection type safety through strict generics, enums with associated values, any Protocol, and Any type erasure?

[] 8. POP vs OOP：面向协议编程如何通过「组合优于继承」解决上帝类问题？值类型与协议扩展默认实现带来了哪些优势？
POP vs OOP: How does Protocol-Oriented Programming solve the God-class problem through "composition over inheritance"? What advantages do value types and protocol extension default implementations bring?

7. 工程实践
Engineering Practice
Focus: Real-world iOS engineering topics including dependency management, architecture design, and technical debt.

[] 1. SPM 依赖管理：你在项目中如何使用 Swift Package Manager？它与 Git Submodule 在代码结构、编译方式和依赖更新方面有何区别？
SPM Dependency Management: How do you use Swift Package Manager in your projects? How does it differ from Git Submodule in code structure, build approach, and dependency updates?

[] 2. 技术债与遗留代码治理：在不影响新功能交付的前提下，如何使用绞杀者模式（Strangler Pattern）和童子军法则渐进式重构遗留代码？
Technical Debt & Legacy Code: How do you use the Strangler Pattern and Boy Scout Rule to progressively refactor legacy code without blocking new feature delivery?

[] 3. Property Wrapper + 泛型封装 UserDefaults：如何利用 @propertyWrapper 和泛型构建类型安全的 UserDefaults 封装，消除样板代码？
Property Wrapper + Generics for UserDefaults: How do you use @propertyWrapper and generics to build a type-safe UserDefaults wrapper that eliminates boilerplate?

[] 4. Generics + Protocol Extension 构建通用网络层：如何使用 APIRequest 协议配合 associatedtype Response: Decodable 和协议扩展统一封装网络请求与解码逻辑？
Generic Network Layer with Protocol Extensions: How do you use an APIRequest protocol with associatedtype Response: Decodable and protocol extensions to unify network request and decoding logic?

[] 5. iOS 项目分层架构：如何设计 Presentation / Domain UseCase / Data Repository 三层架构？Coordinator 如何解耦导航？
iOS Layered Architecture: How do you design a Presentation / Domain UseCase / Data Repository three-layer architecture? How does the Coordinator decouple navigation?

[] 6. Codable 高级模式：如何处理多态解码、容错集合解码（Safe<Base> 包装器）、嵌套 JSON（nestedContainer）和自定义日期策略？
Advanced Codable Patterns: How do you handle polymorphic decoding, fault-tolerant collection decoding (Safe<Base> wrapper), nested JSON (nestedContainer), and custom date strategies?

8. AVFoundation 与视频播放
AVFoundation & Video Playback
Focus: iOS video playback architecture, streaming protocols, and performance optimization.

[] 1. AVFoundation 核心架构：解释 AVAsset → AVPlayerItem → AVPlayer → AVPlayerLayer 的职责链和关系。
AVFoundation Core Architecture: Explain the responsibility chain and relationships of AVAsset → AVPlayerItem → AVPlayer → AVPlayerLayer.

[] 2. HLS 协议与自适应码率：什么是 HLS？Master Playlist 和 Media Playlist 有什么区别？自适应码率切换（ABR）是如何工作的？
HLS Protocol & Adaptive Bitrate: What is HLS? What's the difference between Master Playlist and Media Playlist? How does Adaptive Bitrate Switching (ABR) work?

[] 3. 自定义资源加载与缓存：如何使用 AVAssetResourceLoaderDelegate 拦截网络请求实现离线缓存和自定义请求头？
Custom Resource Loading & Caching: How do you use AVAssetResourceLoaderDelegate to intercept network requests for offline caching and custom headers?

[] 4. FairPlay DRM：解释 FairPlay Streaming 的 SPC/CKC 密钥交换流程。如何在 iOS 中播放加密的 HLS 内容？
FairPlay DRM: Explain the SPC/CKC key exchange workflow in FairPlay Streaming. How do you play encrypted HLS content on iOS?

[] 5. 视频播放性能优化：如何减少首帧加载时间（TTFF）？常见的播放性能瓶颈（CPU 解码回退、过度缓冲、CoreAnimation 合成）有哪些？
Video Playback Performance: How do you reduce Time-To-First-Frame (TTFF)? What are common playback performance bottlenecks (CPU decode fallback, over-buffering, CoreAnimation compositing)?

[] 6. AVPlayer 故障排查：如何逐层诊断 AVPlayer 播放失败？（URL → AVAsset → AVPlayerItem → AVPlayer → AVPlayerLayer）
Debugging AVPlayer Failures: How do you diagnose AVPlayer playback failures layer by layer? (URL → AVAsset → AVPlayerItem → AVPlayer → AVPlayerLayer)

[] 7. 视频断点续播与跨设备同步：如何使用 addPeriodicTimeObserver 记录播放进度并实现断点续播？跨设备同步有哪些存储方案？
Video Resume & Cross-Device Sync: How do you use addPeriodicTimeObserver to record playback progress for resume? What storage strategies exist for cross-device sync?

## Answers

## Answer 1
## Q: 值类型与引用类型：解释 struct 和 class 在内存（栈与堆）方面的区别。2026 年你会何时选择 class 而非 struct？

🧠 Memory Answer (Quick Recall Layer)
Structs are **Value Types** (usually stack-allocated, copied on assignment), while Classes are **Reference Types** (heap-allocated, shared pointer).
**Recall Hook:** "Structs copy data; Classes share identity."

---

📘 Core Explanation (Understanding Layer)
Structs optimize for safety and speed by ensuring each instance is a unique copy (immutability by default). Classes allow shared state and inheritance.
*   **Example Anchor:** Use `struct User` for a data model (passing it around copies the data). Use `class DatabaseManager` for a singleton managing a connection (sharing the same instance).
*   **Pitfall:** Using a `class` for a simple model (like `Video`). Modifying it in one screen inadvertently updates it in another due to shared reference. **Fix:** Use `struct` for data models.
*   **Exception:** Use `class` in 2026 when you need **identity** (===), reference semantics, or Objective-C interoperability (`@objc`).

---

🧩 Structured Summary
**Template: T2 Compare Table (Struct vs Class)**

| Aspect | Struct (Value Type) | Class (Reference Type) |
| :--- | :--- | :--- |
| **Memory** | Stack (mostly) | Heap (ref count) |
| **Behavior** | Copy on assignment | Share reference |
| **Inheritance** | No (Protocols only) | Yes |
| **Typical Use** | Data Models, ViewState | Managers, Coordinators, Identity |
| **Common Pitfall** | "Large struct" copying cost | Unintended shared mutation |
| **Default (2026)** | ✅ **Preferred** | ❌ Only if needed |

**Exception:** Large structs with many heap-allocated properties (like Strings) can still be expensive to copy; Swift uses **Copy-on-Write** (COW) for collections to mitigate this.

## Answer 2
## Q: guard 与 if let：除了代码风格，guard 是如何强制“提前退出”的？Swift 5.7 引入的 if let x 简写是如何工作的？

🧠 Memory Answer (Quick Recall Layer)
`guard` enforces **Early Exit** by requiring a `return`, `throw`, or `break` if the condition fails, keeping the unpacked value available in the **outer scope**.
**Recall Hook:** "Guard checks valid data at the door; if let invites it inside."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `guard let user = user else { return }` ensures execution stops immediately if data is missing, reducing nesting.
*   **Example Anchor:** In a function `process(json: JSON?)`, use `guard` at the top to validate input. If valid, `json` is usable for the rest of the function.
*   **Pitfall:** Using `if let` for validation leads to the "Pyramid of Doom" (deeply nested code). **Fix:** Invert logic with `guard` to flatten the path.
*   **Shorthand:** Swift 5.7 `if let x` is syntax sugar for `if let x = x`. It unwraps the optional into a shadow variable of the same name.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (guard vs if let)**

*   **Use `guard` when:**
    *   Validating preconditions (inputs, state) at the start of a scope.
    *   You need the unwrapped value for the *rest* of the function.
    *   You want to avoid nesting ("happy path" stays left-aligned).
*   **Use `if let` when:**
    *   You only need the value for a short, specific block of logic.
    *   Failure is not an error, just an alternative path (`else`).
*   **Rule of Thumb:** "Fail early with `guard`; handle specifics with `if let`."
*   **Pitfall:** Overusing `guard` in the middle of a complex function can make control flow hard to follow (multiple exit points).

## Answer 3
## Q: 可选型的底层实现：Optional 的本质是什么？（期望提到 enum Optional<Wrapped>）。你能否在不使用 if let 的情况下写一个 switch 语句来解包可选型？

🧠 Memory Answer (Quick Recall Layer)
An Optional is technically an **enum** with two cases: `.none` and `.some(Wrapped)`.
**Recall Hook:** "It’s just a box: either empty (`.none`) or holding content (`.some`)."

---

📘 Core Explanation (Understanding Layer)
Swift Optionals are not "magic"; they are a standard library enum `Optional<T>`. All syntax (`?`, `??`, `if let`) is sugar around this enum.
*   **Example Anchor:** `let x: Int? = nil` is literally `let x = Optional<Int>.none`.
*   **Pitfall:** Force unwrapping (`!`) accesses `.some` without checking, causing a crash if it is `.none`. **Fix:** Always safe unwrap.
*   **Boundary:** You can use `switch` to match `.some(let value)` and `.none` explicitly, which is useful for complex pattern matching.

---

🧩 Structured Summary
**Template: T3 Concept Card (Optional)**

*   **Definition:** An enum `enum Optional<Wrapped> { case none; case some(Wrapped) }`.
*   **Why it exists:** To eliminate the "Null Pointer Exception" by making the absence of a value explicit and type-safe.
*   **Key Properties:**
    1.  **Generic:** Works for any type (`Int?`, `String?`).
    2.  **Monadic:** Supports `map` and `flatMap` to transform the inner value safely.
*   **Switch Example:**
    ```swift
    switch myOptional {
    case .some(let value): print(value)
    case .none: print("Empty")
    }
    ```
*   **Common Misconception:** Thinking `nil` is a pointer to 0; in Swift, `nil` is just the `.none` enum case.

## Answer 4
## Q: 协议扩展：它们是如何实现“默认实现”的？使用 extension 组织代码的优势。

🧠 Memory Answer (Quick Recall Layer)
Protocol Extensions allow providing **default implementations** for methods, enabling "horizontal inheritance" (adding behavior to unrelated types) without a base class.
**Recall Hook:** "Interfaces define *what*; Extensions define *how* (by default)."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** By extending a protocol, you provide a method body that any conforming type uses unless it overrides it.
*   **Example Anchor:** `extension Shakeable { func shake() { ... } }`. Any `UIView` or `Button` conforming to `Shakeable` gets `shake()` for free.
*   **Pitfall:** **Static vs Dynamic Dispatch**. If a method is defined *only* in the extension (not in the protocol body), it uses static dispatch. If the conforming type implements it, it might not be called if cast to the protocol. **Fix:** Always declare the method in the protocol definition if you want polymorphism.
*   **Usage:** Grouping code by functionality (e.g., `MARK: - DataSource`) keeps files clean.

---

🧩 Structured Summary
**Template: T3 Concept Card (Protocol Extensions)**

*   **Definition:** An extension on a `protocol` type to add methods or computed properties.
*   **Key Purpose:**
    1.  **Default Implementation:** Reduce boilerplate for conforming types.
    2.  **Traits/Mixins:** Add capability (e.g., `Serializeable`) to many types without inheritance.
*   **Code Organization:** Use `extension MyView: UITableViewDelegate` to isolate delegate logic physically in the file.
*   **Pitfall (Dispatch):**
    *   **Declared in Protocol:** Dynamic dispatch (Witness Table) -> Calls specific implementation.
    *   **Extension Only:** Static dispatch -> Calls extension implementation (risk of unexpected behavior).

## Answer 5
## Q: 访问控制：区分 fileprivate、private 和 internal。为什么 private(set) 对整洁架构很有用？

🧠 Memory Answer (Quick Recall Layer)
`private` is scope-limited (class/struct), `fileprivate` is file-limited, and `internal` is module-limited (default).
**Recall Hook:** "Private is for *me*, Fileprivate is for *us in this file*, Internal is for *the app*."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `private(set)` makes a property **read-only** to the public but **writable** privately. This enforces encapsulation.
*   **Example Anchor:** In a ViewModel: `private(set) var state: State`. The View can read `state` to render, but cannot change it directly; it must call a method like `updateState()`.
*   **Pitfall:** Overusing `fileprivate`. If a file is 2000 lines long, `fileprivate` is basically global. **Fix:** Keep files small or use `private` combined with extensions in the same file (Swift 4+ allows `private` access in extensions).
*   **Boundary:** `open` (subclassable outside module) vs `public` (accessible but not subclassable).

---

🧩 Structured Summary
**Template: T2 Compare Table (Access Control)**

| Level | Scope | Typical Use |
| :--- | :--- | :--- |
| **private** | `{ }` Scope | Internal helper methods, backing variables |
| **fileprivate** | Current `.swift` file | Extensions accessing private state |
| **internal** | Module (App Target) | **Default**. Most app code |
| **public/open** | Any Module | Frameworks / Libraries |

*   **Rule of Thumb:** Start with `private`. Promote to `internal` only if needed.
*   **Why private(set)?** The "Golden Rule" of Clean Architecture: **Unidirectional Data Flow**. Only the owner should mutate state; others just observe.

## Answer 6
## Q: 计算属性与存储属性：属性在什么时候是计算型的？计算属性是否占用内存存储？

🧠 Memory Answer (Quick Recall Layer)
**Stored Properties** reserve memory to hold a value, whereas **Computed Properties** are like functions: they calculate the value on-the-fly every time they are accessed.
**Recall Hook:** "Stored is a variable; Computed is a function disguised as a variable."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** A computed property provides a `get` (and optionally `set`) block. It occupies **zero** storage in the instance memory layout.
*   **Example Anchor:** `var area: Double { return width * height }`. Accessing `area` recalculates the math each time.
*   **Pitfall:** Performing expensive operations (filtering arrays, database access) in a computed property. Users assume property access is O(1) and instant. **Fix:** If it's expensive, make it a function (`calculateArea()`) or use lazy loading.
*   **Boundary:** `lazy var` is a stored property that is initialized only when first accessed (computed once, then stored).

---

🧩 Structured Summary
**Template: T2 Compare Table (Stored vs Computed)**

| Aspect | Stored Property | Computed Property |
| :--- | :--- | :--- |
| **Storage** | Occupies Memory (Size of type) | **Zero** memory storage |
| **Access** | Returns existing value (Read) | Executes code (Calculate) |
| **Performance** | O(1) Instant | Depends on calculation complexity |
| **Initialization** | Must be init before use | N/A (Dynamic) |
| **Observer Support** | `willSet`, `didSet` | Not directly (use set block) |
| **Common Pitfall** | Memory usage | Hidden CPU cost |

## Answer 7
## Q: defer 语句：多个 defer 块的执行顺序是怎样的？（后进先出）。为什么这对于资源清理很有用？

🧠 Memory Answer (Quick Recall Layer)
`defer` blocks execute exactly when the current scope exits (return/throw/break), in **LIFO (Last-In, First-Out)** order (reverse of declaration).
**Recall Hook:** "First to open, last to close."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Swift schedules `defer` actions on a stack. When the scope ends, the stack pops and executes them.
*   **Example Anchor:**
    ```swift
    func readFile() {
        let file = openFile()
        defer { closeFile(file) } // Guaranteed to run
        // ... process file ...
        if error { throw Error } // defer runs here too
    }
    ```
*   **Pitfall:** Putting `defer` at the end of the function. If an error is thrown *before* the `defer` line is reached, the cleanup won't happen. **Fix:** Place `defer` immediately after resource allocation.
*   **Boundary:** `defer` does NOT execute if the app crashes (SIGSEGV) or the thread is killed.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Using defer)**

1.  **Precondition:** You have a resource that must be released (File handle, Lock, Pointer).
2.  **Action:** Allocate resource.
3.  **Action:** Immediately write `defer { cleanup() }`.
4.  **Action:** Perform logic.
5.  **Validation:** Ensure `defer` is executed regardless of `return` or `throw`.
6.  **Order Rule:**
    *   `defer { print("A") }`
    *   `defer { print("B") }`
    *   **Output:** "B", then "A".

## Answer 8
## Q: 闭包：什么是“尾随闭包”？@escaping（逃逸）和非逃逸闭包之间有什么区别？

🧠 Memory Answer (Quick Recall Layer)
**Trailing Closure** syntax allows omitting parentheses if the closure is the last argument. **@escaping** allows the closure to be stored and executed *after* the function returns.
**Recall Hook:** "Non-escaping runs *now*; Escaping runs *later*."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** By default, closures are **non-escaping** (guaranteed to execute before the function returns), allowing compiler optimizations (no allocation). `@escaping` moves it to the heap to survive the stack frame.
*   **Example Anchor:** `DispatchQueue.main.async { ... }` requires an `@escaping` closure because the function returns immediately, but the code runs on the next run loop tick. `array.map { ... }` is non-escaping.
*   **Pitfall:** Reference Cycles. Escaping closures capture `self` strongly by default. **Fix:** Use `[weak self]` in escaping closures.
*   **Boundary:** Optional closures `(() -> Void)?` are implicitly escaping (because they are stored in the enum `.some`).

---

🧩 Structured Summary
**Template: T2 Compare Table (Escaping vs Non-Escaping)**

| Aspect | Non-Escaping (Default) | @escaping |
| :--- | :--- | :--- |
| **Lifecycle** | Ends before function returns | Outlives function scope |
| **Memory** | Stack (often optimized) | Heap (Reference counted) |
| **Use Case** | `map`, `filter`, synchronous work | Async callbacks, Storage |
| **Self Capture** | Implicit (Safe) | **Strong** (Risk of Cycle) |
| **Syntax** | No attribute needed | Must mark `@escaping` |
| **Common Pitfall** | N/A | Forgetting `[weak self]` |

## Answer 9
## Q: 带有关联值的枚举：它们与“原始值”有何不同？举一个建模应用状态（如 .loading, .success(Data), .error(Error)）的用例。

🧠 Memory Answer (Quick Recall Layer)
**Raw Values** are static compile-time constants (all cases same type). **Associated Values** allow storing dynamic, runtime data specific to each case.
**Recall Hook:** "Raw Value is a label; Associated Value is payload."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Associated values turn Enums into "Sum Types" (Discriminated Unions), where each case can hold completely different data types.
*   **Example Anchor:**
    ```swift
    enum ViewState {
        case loading
        case success(Data) // Stores actual binary data
        case error(String) // Stores error message
    }
    ```
*   **Pitfall:** Equality checks. You cannot compare `state1 == state2` automatically because associated values might not be Equatable. **Fix:** Manually conform to `Equatable` or use pattern matching (`if case`).
*   **Usage:** Perfect for Finite State Machines (FSM) where states have mutually exclusive data (e.g., you can't have `Data` AND `Error` at the same time).

---

🧩 Structured Summary
**Template: T2 Compare Table (Raw vs Associated Values)**

| Aspect | Raw Values | Associated Values |
| :--- | :--- | :--- |
| **Data Time** | Compile-time (Constant) | Runtime (Dynamic) |
| **Type Constraint** | Must be same (e.g., all `Int`) | Can be different per case |
| **Storage** | None (computed from index) | Stores actual payload |
| **Equality** | Auto-Equatable | Manual or conditional |
| **Serialization** | Easy (`Codable` default) | Complex (Custom coding) |
| **Example** | `case up = "UP"` | `case move(x: Int, y: Int)` |

## Answer 10
## Q: 类型别名：typealias 如何提高代码可读性，特别是在处理复杂的闭包签名时？

🧠 Memory Answer (Quick Recall Layer)
`typealias` creates a semantic name for an existing type without creating a new type. It simplifies complex signatures (like nested closures) into readable labels.
**Recall Hook:** "Don't repeat the signature; give it a name."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The compiler treats the alias exactly as the underlying type.
*   **Example Anchor:** Instead of `func fetch(completion: (Result<User, NetworkError>) -> Void)`, use:
    `typealias UserHandler = (Result<User, NetworkError>) -> Void`
    `func fetch(completion: UserHandler)`
*   **Pitfall:** Over-aliasing simple types (e.g., `typealias Number = Int`). This obscures what the data actually is. **Fix:** Only alias complex tuples, closures, or generic compositions.
*   **Boundary:** It is **not** a wrapper. `typealias ID = String` means `ID` and `String` are interchangeable and have no type safety difference.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (typealias)**

*   **Use when:**
    *   Closure signatures are long or reused in multiple places.
    *   Combining protocols (e.g., `typealias UIComponent = UIView & Reusable`).
    *   Renaming generic constraints for clarity (`typealias Grid = Array<Array<Int>>`).
*   **Avoid when:**
    *   Renaming primitives just for "flavor" (`typealias Dollars = Double` -> use a struct for type safety instead).
*   **Rule of Thumb:** "If you have to copy-paste a type signature more than twice, alias it."

## Answer 11
## Q: ARC 机制：ARC 是在编译时还是运行时运行？（编译时插入 retain/release）。

🧠 Memory Answer (Quick Recall Layer)
ARC runs at **Compile Time**. It is not a Garbage Collector; the compiler analyzes code and inserts `retain` and `release` calls automatically.
**Recall Hook:** "Compiler does the paperwork (counting) before the app even runs."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** When you assign a class instance, ARC adds a `retain`; when it goes out of scope, it adds a `release`. When the count hits 0, `deinit` runs.
*   **Example Anchor:**
    ```swift
    var user = User() // +1
    var backup = user // +1 (Count: 2)
    user = nil        // -1 (Count: 1)
    backup = nil      // -1 (Count: 0) -> Dealloc
    ```
*   **Pitfall:** Believing it handles everything. ARC **cannot** handle Retain Cycles (Reference Cycles) automatically like Java GC does. **Fix:** Use `weak`.
*   **Boundary:** `autoreleasepool` delays the release of objects until the pool drains (runtime).

---

🧩 Structured Summary
**Template: T2 Compare Table (ARC vs Tracing GC)**

| Aspect | ARC (Swift/ObjC) | Tracing GC (Java/Kotlin) |
| :--- | :--- | :--- |
| **Timing** | **Compile Time** (mostly) | Runtime |
| **Pause** | Deterministic (No pauses) | "Stop the world" pauses |
| **Memory Overhead** | Low (Reference Counters) | High (Graph traversal) |
| **Cycles** | ❌ **Manual fix needed (weak)** | ✅ Handled automatically |
| **Predictability** | High (Object dies at `}`) | Low (Dies "eventually") |

## Answer 12
## Q: 强引用与弱引用：为什么弱引用必须始终是可选类型的变量？

🧠 Memory Answer (Quick Recall Layer)
**Strong References** increase the retain count. **Weak References** do not, and they must be **Optional variables (`var`)** because they can become `nil` at runtime when the object is deallocated.
**Recall Hook:** "Strong holds on; Weak lets go (and turns to nil)."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** A `weak` reference tracks the object's "side table." If the object dies, ARC zeros out the weak pointer.
*   **Example Anchor:** `weak var delegate: Delegate?`. If the `Delegate` object is deallocated elsewhere, accessing `self.delegate` yields `nil` safely.
*   **Pitfall:** Declaring `weak let`. It fails to compile because the value *must* change to `nil` if the object dies. **Fix:** Always use `weak var`.
*   **Boundary:** Weak references do not protect the object from deallocation.

---

🧩 Structured Summary
**Template: T2 Compare Table (Strong vs Weak)**

| Aspect | Strong | Weak |
| :--- | :--- | :--- |
| **Retain Count** | +1 | +0 |
| **Deallocation** | Prevents it | Allows it |
| **Type Requirement** | Any | Must be `Optional` |
| **Mutability** | `let` or `var` | Must be `var` |
| **Use Case** | Ownership (Parent -> Child) | Back-reference (Child -> Parent) |
| **Nil Behavior** | N/A | Automatically becomes `nil` |

## Answer 13
## Q: 无主引用：什么时候使用 unowned 是安全的？如果你在对象释放后访问无主引用会发生什么？（崩溃）。

🧠 Memory Answer (Quick Recall Layer)
Use `unowned` when the referenced object is guaranteed to outlive the holder (never nil). Accessing it after deallocation causes a **hard crash**.
**Recall Hook:** "Unowned is a pledge: 'I promise this exists'. Break the promise, crash the app."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Like `weak`, it doesn't increase retain count. Unlike `weak`, it is not Optional.
*   **Example Anchor:** `class CreditCard { unowned let owner: Customer }`. A card cannot exist without an owner, and the owner logically owns the card (longer lifecycle).
*   **Pitfall:** Using `unowned` in asynchronous closures (network). The owner might close the screen (dealloc) before the network returns. **Fix:** Use `weak` for async/uncertain lifecycles.
*   **Boundary:** `unowned(safe)` (default) checks for deallocation and crashes; `unowned(unsafe)` acts like a C-style dangling pointer (undefined behavior).

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Weak vs Unowned)**

*   **Use `weak` (Default) when:**
    *   The other object might become `nil` (independent lifecycles).
    *   Delegates (`delegate`).
    *   Async closures (`[weak self]`).
*   **Use `unowned` when:**
    *   The two objects have a tighter lifecycle coupling (Child -> Parent).
    *   The referenced object **must** exist for this object to exist.
    *   Performance is critical (slightly faster than weak, fewer optional unwraps), but rarely the bottleneck.
*   **Pitfall:** "When in doubt, use `weak`." A crash is worse than an Optional unwrapping.

## Answer 14
## Q: 循环引用：描述一个 View Controller 和 ViewModel（或代理）之间典型的循环引用场景。

🧠 Memory Answer (Quick Recall Layer)
A Retain Cycle occurs when A holds B strongly, and B holds A strongly. Neither can ever be deallocated.
**Recall Hook:** "A holding B holding A = Memory Leak."

---

📘 Core Explanation (Understanding Layer)
*   **Scenario:**
    1.  `ViewController` owns `viewModel` (Strong).
    2.  `ViewModel` has a closure property `onUpdate`.
    3.  `ViewController` assigns `viewModel.onUpdate = { self.updateUI() }`.
    4.  The closure captures `self` (VC) strongly.
    5.  **Cycle:** VC -> VM -> Closure -> VC.
*   **Pitfall:** Not seeing the cycle because closures capture implicitly. **Fix:** `viewModel.onUpdate = { [weak self] in self?.updateUI() }`.
*   **Diagnosis:** Use Xcode's **Debug Memory Graph**; look for purple exclamation marks or objects that persist after closing a screen.

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Retain Cycles)**

*   **Symptom:** Memory usage grows; `deinit` is never called; app slows down.
*   **Common Causes:**
    1.  **Delegates:** Declaring `var delegate: Protocol` instead of `weak var`.
    2.  **Closures:** Capturing `self` strongly in a property-stored closure.
    3.  **Timers:** `Timer.scheduledTimer` captures `target` strongly (pre-iOS 10 / non-block based).
*   **Fix:**
    *   Break the cycle by making one link `weak` or `unowned`.
    *   Child should hold `weak` reference to Parent.

## Answer 15
## Q: 捕获列表：解释闭包中的 [weak self]。如果你在网络回调中不使用它会发生什么？

🧠 Memory Answer (Quick Recall Layer)
The Capture List `[weak self]` instructs the closure to capture `self` weakly, preventing a strong reference cycle. Without it, `self` is retained until the closure finishes.
**Recall Hook:** "Capture list defines the *rules of engagement* for variables inside the closure."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `[weak self]` creates a local optional variable `self` inside the closure scope.
*   **Example Anchor:**
    ```swift
    network.fetch { [weak self] data in
        self?.data = data // Safe. If self is dead, this line does nothing.
    }
    ```
*   **Pitfall:** **The "Weak-Strong Dance"**. `guard let self = self else { return }`. If you don't do this, `self` is optional throughout. Doing this retains `self` strongly *only for the duration of the closure execution*.
*   **Scenario (No weak self):** If the user backs out of the screen, the VC should dealloc. But the pending network request holds the closure, which holds the VC. The VC stays alive (zombie) until the request finishes, potentially updating a UI that doesn't exist.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Breaking Cycles)**

1.  **Identify:** Is the closure stored in a property (directly or indirectly)?
2.  **Decision:** If yes -> Use `[weak self]`. If no (e.g., `UIView.animate`), `strong` is usually fine.
3.  **Implementation:** Add `[weak self]` to the start of the closure.
4.  **Handling:** Decide how to handle `nil`.
    *   **Option A:** `self?.doSomething()` (Silent failure).
    *   **Option B:** `guard let self = self else { return }` (Early exit, but ensures atomicity if it runs).

## Answer 16
## Q: 集合类型：Swift 数组是值类型还是引用类型？当你向函数传递一个巨大的数组时会发生什么？（写时复制）。

🧠 Memory Answer (Quick Recall Layer)
Swift Arrays and Dictionaries are **Value Types** (Structs). They use **Copy-on-Write (COW)**, meaning the actual data is only copied when one of the copies is **modified**.
**Recall Hook:** "Pass by value, copy on mutation."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `var b = a`. `a` and `b` share the same memory buffer pointer. If you write `b.append(1)`, Swift checks reference count. If > 1, it allocates new memory for `b` and copies data.
*   **Example Anchor:** Passing a 10MB array to a function `func analyze(_ arr: [Int])` costs essentially nothing (pointer copy).
*   **Pitfall:** "Premature Optimization". Don't wrap arrays in classes just to avoid copying. COW handles it.
*   **Boundary:** `NSArray` (Objective-C) is a Reference Type. Bridge casting (`as [Int]`) might trigger a copy if not bridged lazily.

---

🧩 Structured Summary
**Template: T2 Compare Table (Value vs Ref Collection)**

| Aspect | Swift Array (Struct) | NSArray (Class) |
| :--- | :--- | :--- |
| **Type** | Value | Reference |
| **Assignment** | Share buffer (COW) | Share pointer |
| **Mutation** | Triggers Copy (if shared) | Mutates shared instance (if Mutable) |
| **Thread Safety** | Safer (local state) | Harder (shared state) |
| **Performance** | O(1) Copy (initially) | O(1) Copy (pointer) |

## Answer 17
## Q: Codable：如何处理与属性名不匹配的 JSON 键（CodingKeys）？

🧠 Memory Answer (Quick Recall Layer)
Use a nested enum named **`CodingKeys`** conforming to `String, CodingKey` to map Swift property names (camelCase) to JSON keys (snake_case or other).
**Recall Hook:** "Your keys, their keys; map them in the enum."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The compiler looks for this specific enum. If present, it uses it for encoding/decoding key generation.
*   **Example Anchor:**
    ```swift
    struct User: Codable {
        var firstName: String
        enum CodingKeys: String, CodingKey {
            case firstName = "first_name" // Maps Swift to JSON
        }
    }
    ```
*   **Pitfall:** **Incomplete List.** If you define `CodingKeys`, you must list **all** properties you want to codify. Omitting one excludes it from the process.
*   **Boundary:** You can use `keyDecodingStrategy = .convertFromSnakeCase` on `JSONDecoder` to handle simple cases without manual keys.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Mapping Keys)**

1.  **Precondition:** Mismatched names (e.g., API sends `user_id`, you want `userId`).
2.  **Step:** Create `enum CodingKeys: String, CodingKey`.
3.  **Step:** Add cases for ALL properties.
4.  **Step:** Assign raw values only to the ones that differ (`case userId = "user_id"`).
5.  **Step:** Leave matching ones as `case name`.
6.  **Verify:** Run a test decoder; ensure no "Key not found" error.

## Answer 18
## Q: Result 类型：与 throwing 函数相比，Result<Success, Failure> 如何改进错误处理？

🧠 Memory Answer (Quick Recall Layer)
`Result` treats success or failure as a **value** that can be stored and passed around asynchronously, whereas `throws` is a control flow mechanism strictly for synchronous scope.
**Recall Hook:** "Result is data; Throws is action."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `Result` is an enum with `.success(T)` and `.failure(E)`. It reifies the outcome into a variable.
*   **Example Anchor:** In an async completion handler: `func fetch(completion: (Result<User, NetworkError>) -> Void)`. This forces the caller to handle the specific error type.
*   **Pitfall:** **Nested Switches**. Switching on Result inside a closure can get messy. **Fix:** Use functional methods like `.map`, `.flatMap`, or `.get()` (to convert back to try/catch).
*   **Boundary:** Swift 6 Typed Throws (`throws(MyError)`) might replace `Result` in some sync contexts, but `Result` remains king for async callbacks (pre-async/await).

---

🧩 Structured Summary
**Template: T2 Compare Table (Result vs Throws)**

| Aspect | Result Type | Throwing Function |
| :--- | :--- | :--- |
| **Nature** | Value (Enum) | Control Flow |
| **Async Support** | ✅ Excellent (Completion handlers) | ❌ (Pre-async/await) |
| **Error Typing** | Strongly typed (`Result<S, E>`) | Untyped `Error` (Swift 5) |
| **Storage** | Can be stored in a variable | Must be handled immediately |
| **Syntax** | `switch result` | `do { try ... } catch` |
| **Conversion** | `result.get()` -> throws | `Result { try ... }` |

## Answer 19
## Q: some 关键字：什么是“不透明类型”？为什么我们在 SwiftUI 中经常看到 some View？

🧠 Memory Answer (Quick Recall Layer)
`some` defines an **Opaque Type**. It tells the compiler "I am returning a specific concrete type, but I hide its identity from the caller," preserving type identity internally.
**Recall Hook:** "I promise it's *some* View, but I won't tell you exactly which one."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It allows returning complex generic types (like `VStack<TupleView<(Text, Image)>>`) without writing them out. The compiler knows the exact type, but the API consumer only sees the protocol `View`.
*   **Example Anchor:** `var body: some View`. If you changed it to return just `View` (Protocol Type), the compiler would lose optimization info and associated type guarantees.
*   **Pitfall:** **Branching Types**. You cannot return `Text` in `if` and `Image` in `else`. The underlying type must be consistent. **Fix:** Wrap in `AnyView` (erased) or use `@ViewBuilder` (Group).
*   **Why:** Essential for SwiftUI's diffing algorithm, which relies on static type structure.

---

🧩 Structured Summary
**Template: T3 Concept Card (Opaque Types)**

*   **Definition:** A reverse generic. The function *implementation* chooses the type, not the caller.
*   **Syntax:** `func make() -> some Protocol`.
*   **Why it exists:**
    1.  **Hiding Complexity:** Avoids returning `Generic<Generic<...>>`.
    2.  **Performance:** Keeps static dispatch and optimization (unlike `any Protocol`).
*   **Constraint:** All return paths must return the **same** underlying type.
*   **Common Misconception:** Thinking `some View` is the same as `View`. `some View` is a concrete type; `View` is a box (existential).

## Answer 20
## Q: 错误处理：try、try? 和 try! 之间有什么区别？

🧠 Memory Answer (Quick Recall Layer)
`try` propagates the error (needs handling), `try?` converts the result to an **Optional** (nil on error), and `try!` **crashes** if an error occurs (force unwrap).
**Recall Hook:** "Try handles; Try? ignores; Try! risks death."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:**
    *   `try`: Standard. Used in `do-catch` or `throws` functions.
    *   `try?`: Suppresses error details. Returns `T?`.
    *   `try!`: Asserts success. Returns `T`.
*   **Example Anchor:**
    *   `let data = try? decoder.decode(...)`. If JSON is bad, `data` is nil. Good for "I don't care why it failed".
    *   `let regex = try! NSRegularExpression(pattern: ".*")`. Safe ONLY if hardcoded.
*   **Pitfall:** Using `try!` in dynamic logic (e.g., parsing user input). **Fix:** Never use `try!` unless the input is guaranteed by the developer (static resources).

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Error Handling Styles)**

*   **Use `try` when:**
    *   You need to handle the specific error (e.g., show an alert "Network Offline").
    *   You are in a `do-catch` block.
*   **Use `try?` when:**
    *   The failure reason doesn't matter (e.g., optional feature).
    *   You want to convert failure to `nil`.
*   **Use `try!` when:**
    *   You are loading a resource bundled with the app (e.g., Sound, Font, Regex).
    *   Failure implies a developer configuration error (crash is better than broken state).

## Answer 21
## Q: 扩展：能否通过扩展向类添加存储属性？（不能）。为什么？

🧠 Memory Answer (Quick Recall Layer)
**No**, extensions cannot add stored properties because it would change the **memory layout** (size) of the object, breaking binary compatibility with existing compiled code.
**Recall Hook:** "Extensions add behavior (methods), not weight (storage)."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** A class's size is determined at compile time. Extensions can be in different modules. Adding storage would require recompiling the original class and all its clients.
*   **Example Anchor:**
    ```swift
    extension UIView {
        var id: String = "123" // ❌ Compiler Error: Extensions must not contain stored properties.
    }
    ```
*   **Workaround:** Use **Associated Objects** (`objc_setAssociatedObject`). This attaches data at runtime using a hash table, but it's slower and requires `import ObjectiveC`.
*   **Boundary:** Extensions *can* add **Computed Properties** because they are just function calls.

---

🧩 Structured Summary
**Template: T3 Concept Card (Extension Limitations)**

*   **Rule:** Extensions add functionality, not state.
*   **Why:**
    *   **ABI Stability:** Memory layout of the instance is fixed.
    *   ** fragility:** If extensions added size, loading a dynamic library could crash the app due to size mismatch.
*   **What you CAN add:**
    1.  Computed properties.
    2.  Methods.
    3.  Initializers (Convenience only for classes).
    4.  Subscripts.
    5.  Protocol conformances.
*   **Exception:** In the **same file**, you can use a private extension to group code, but the stored property must still be in the main declaration (or the main declaration handles the storage).

## Answer 22
## Q: 同步与异步：如果在主线程调用 DispatchQueue.main.sync 会发生什么？（死锁）。为什么？

🧠 Memory Answer (Quick Recall Layer)
Calling `DispatchQueue.main.sync` from the main thread causes a **Deadlock**. The main thread waits for the block to finish, but the block needs the main thread to be free to start.
**Recall Hook:** "I am waiting for myself to finish working. Result: Frozen forever."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `sync` blocks the *current* thread until the task completes. If the target queue is the *same* as the current thread's serial queue (like Main), they block each other.
*   **Example Anchor:**
    ```swift
    // On Main Thread
    DispatchQueue.main.sync {
        print("This line is never reached")
    }
    ```
*   **Pitfall:** Assuming `sync` is just "run immediately". It effectively is, but with blocking semantics.
*   **Exception:** `DispatchQueue.main.async` schedules it for the *next* run loop cycle, which is safe.

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Deadlocks)**

*   **Symptom:** App freezes completely (0% CPU or 100% CPU depending on spin), UI unresponsive, Watchdog kills app.
*   **Cause:** Calling `sync` on the *current* Serial Queue.
*   **Fix:** Use `async` instead of `sync` when targeting the current queue.
*   **Prevention:** `if Thread.isMainThread { execute() } else { DispatchQueue.main.sync { execute() } }` (Careful with this pattern, `async` is usually safer).

## Answer 23
## Q: 服务质量：解释 .userInteractive, .userInitiated, .utility 和 .background 之间的区别。系统如何确定它们的优先级？

🧠 Memory Answer (Quick Recall Layer)
**QoS (Quality of Service)** tells the system how to prioritize threads.
*   **Interactive:** Animations (Highest).
*   **Initiated:** User tapped button (High).
*   **Utility:** Progress bar/IO (Low).
*   **Background:** Indexing/Cleanup (Lowest).
**Recall Hook:** "UI -> User Waiting -> Long Task -> Hidden Task."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The OS allocates CPU time slices based on QoS. High QoS gets more time and runs on "Performance" cores (P-cores). Low QoS runs on "Efficiency" cores (E-cores).
*   **Example Anchor:**
    *   `.userInteractive`: Scroll view animation.
    *   `.userInitiated`: Loading JSON after a pull-to-refresh.
    *   `.utility`: Exporting a video file (takes seconds/minutes).
    *   `.background`: Core Data database maintenance.
*   **Pitfall:** **Priority Inversion**. If a high-priority task waits for a lock held by a low-priority task, the system must temporarily boost the low one (Priority Inheritance) to unblock it.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Choosing QoS)**

*   **Use `.userInteractive` when:**
    *   Drawing to screen, animations, handling touch events.
    *   **Goal:** 60/120 fps.
*   **Use `.userInitiated` when:**
    *   The user did something and is staring at the screen waiting for a result.
    *   **Goal:** Instant feedback.
*   **Use `.utility` when:**
    *   Long-running computation or I/O.
    *   User can switch apps or do other things while waiting.
*   **Use `.background` when:**
    *   Task is not visible to the user (syncing, indexing).
    *   **Goal:** Battery saving.

## Answer 24
## Q: 调度组：如何使用 GCD 等待 3 个不同的 API 调用完成后再更新 UI？

🧠 Memory Answer (Quick Recall Layer)
Use a **`DispatchGroup`**. Call `enter()` before each request starts, `leave()` inside the completion handler, and `notify()` to trigger the final code.
**Recall Hook:** "Enter, Enter, Enter... Leave, Leave, Leave... Notify!"

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It acts as a thread-safe counter. `notify` fires when the counter hits 0.
*   **Example Anchor:**
    ```swift
    let group = DispatchGroup()
    // Task 1
    group.enter()
    api.fetchProfile { group.leave() }
    // Task 2
    group.enter()
    api.fetchFriends { group.leave() }
    
    group.notify(queue: .main) {
        print("All Done!")
        self.updateUI()
    }
    ```
*   **Pitfall:** **Mismatched Calls.** If `enter()` is called 3 times but `leave()` only 2 times, `notify` never fires. If `leave()` is called extra times, the app crashes. **Fix:** Ensure `leave()` is in a `defer` block or guaranteed path.

---

🧩 Structured Summary
**Template: T4 Process Checklist (DispatchGroup)**

1.  **Create:** `let group = DispatchGroup()`.
2.  **Loop/Sequence:**
    *   Call `group.enter()`.
    *   Start Async Task.
    *   **Inside Callback:** Call `group.leave()`.
3.  **Finish:** Call `group.notify(queue: .main) { ... }`.
4.  **Alternative:** `await` with `TaskGroup` (modern Swift) is safer and cleaner.

## Answer 25
## Q: 信号量：什么是 DispatchSemaphore？为什么在主线程使用它等待异步任务很危险？

🧠 Memory Answer (Quick Recall Layer)
`DispatchSemaphore` is a counter-based lock used to control concurrent access or wait for a signal. **Waiting on the Main Thread** freezes the app (ANR) because it blocks the Run Loop.
**Recall Hook:** "Semaphores are Red/Green lights. Don't put a Red light on the Main Highway."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `wait()` decrements counter (blocks if < 0). `signal()` increments it (wakes waiting thread).
*   **Example Anchor:**
    *   **Resource Limit:** `let sem = Semaphore(value: 3)` ensures only 3 downloads run at once.
    *   **Legacy Sync:** `sem.wait()` used to force an async function to be synchronous (bad practice now).
*   **Pitfall:** Calling `sem.wait()` on Main Thread. If the async task needs the Main Thread to complete (e.g., callback), you get a **Deadlock**. Even if not, you get a frozen UI.
*   **Boundary:** Replaced by `Async/Await` (suspension points don't block threads).

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Semaphores on Main)**

*   **Symptom:** Application Not Responding (ANR), spinning beachball.
*   **Cause:**
    ```swift
    // BAD CODE
    let sem = DispatchSemaphore(value: 0)
    network.fetch { sem.signal() }
    sem.wait() // BLOCKS MAIN THREAD HERE
    ```
*   **Fix:** Refactor to use completion handlers, `DispatchGroup.notify`, or `async/await`.
*   **Rule:** **NEVER** call `wait()` on the Main Thread.

## Answer 26
## Q: 栅栏：如何使用 DispatchQueue 并发队列和 barrier 实现线程安全的读写模式？

🧠 Memory Answer (Quick Recall Layer)
Use a **Concurrent Queue**. Reads are normal `sync/async` tasks (parallel). Writes are submitted with the `.barrier` flag, which ensures they run **exclusively** (stops all other reads/writes).
**Recall Hook:** "Readers flow like water; The Barrier is a dam for writing."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:**
    *   **Reads:** Concurrent. Multiple threads can read `array` at once.
    *   **Barrier Write:** Waits for current reads to finish. Then executes alone. Then allows new reads.
*   **Example Anchor:**
    ```swift
    let queue = DispatchQueue(label: "db", attributes: .concurrent)
    var _data = [String]()
    
    var data: [String] {
        get { queue.sync { _data } } // Read (Concurrent)
        set { queue.async(flags: .barrier) { _data = newValue } } // Write (Exclusive)
    }
    ```
*   **Pitfall:** Using a **Serial Queue**. A serial queue is already a barrier (one at a time), so `.barrier` flag does nothing special.
*   **Boundary:** This is the "Reader-Writer Lock" pattern.

---

🧩 Structured Summary
**Template: T3 Concept Card (Reader-Writer Barrier)**

*   **Goal:** Thread-safe variable with high read performance.
*   **Tool:** `DispatchQueue` (Concurrent).
*   **Read Strategy:** `queue.sync` (Blocks caller, returns value, allows parallel reads).
*   **Write Strategy:** `queue.async(flags: .barrier)` (Non-blocking caller, executes exclusively).
*   **Benefit:** Faster than a simple Serial Queue (Lock) if reads > writes.
*   **Note:** In Swift 6, `Actor` replaces this pattern automatically.

## Answer 27
## Q: 调度工作项：如何在 GCD 中取消任务？（你可以取消工作项，但如果任务已经开始执行，它不会停止）。

🧠 Memory Answer (Quick Recall Layer)
Call `cancel()` on the `DispatchWorkItem`. However, this only prevents it from **starting** if it's still in the queue. If it's **running**, the code inside must explicitly check `isCancelled` to stop itself.
**Recall Hook:** "Cancel tears up the ticket, but it doesn't pull the driver out of the car."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `cancel()` sets a boolean flag. The queue checks this flag before dequeuing. The closure code ignores it unless written to check it.
*   **Example Anchor:**
    ```swift
    let item = DispatchWorkItem {
        for i in 0...10000 {
            if item.isCancelled { break } // Must check manually!
            process(i)
        }
    }
    queue.async(execute: item)
    // Later
    item.cancel()
    ```
*   **Pitfall:** Expecting `cancel()` to work like killing a process. If the block is a single giant synchronous calculation, it won't stop until finished.
*   **Boundary:** Modern `Task.cancel()` works similarly (cooperative cancellation), but `Task` handles nested cancellation better.

---

🧩 Structured Summary
**Template: T2 Compare Table (WorkItem vs Task Cancellation)**

| Aspect | DispatchWorkItem (GCD) | Task (Swift Concurrency) |
| :--- | :--- | :--- |
| **Check Mechanism** | `item.isCancelled` | `Task.isCancelled` |
| **Pending State** | Removed from queue | Ignored when started |
| **Running State** | Must check manually | Must check manually |
| **Propagation** | Manual | Automatic to child tasks |
| **Throwing** | N/A (Return) | `try Task.checkCancellation()` |

## Answer 28
## Q: 挂起点：await 到底发生了什么？线程会阻塞吗？（不，它会出让控制权）。

🧠 Memory Answer (Quick Recall Layer)
**`await`** creates a **Suspension Point**. It does **not** block the thread; instead, it yields the thread back to the System Thread Pool, allowing the thread to execute other tasks while the original function waits.
**Recall Hook:** "Await is not a Stop sign; it's a 'Yield' sign."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** When `await` is hit, the function state (stack frame) is saved to the heap. The thread leaves the function to do other work. When the async work finishes, the system schedules the function to resume (possibly on a different thread).
*   **Example Anchor:**
    ```swift
    func process() async {
        let data = await download() // Thread is free here!
        print(data) // Might resume on a different thread
    }
    ```
*   **Pitfall:** Blocking the thread with `sleep(5)` inside an async function. This effectively "steals" a thread from the cooperative pool, reducing overall concurrency. **Fix:** Use `try await Task.sleep(...)`.
*   **Boundary:** `await` does not guarantee *which* thread resumes execution (unless on `@MainActor`).

---

🧩 Structured Summary
**Template: T2 Compare Table (Blocking vs Suspending)**

| Aspect | Blocking (Sync) | Suspending (Async/Await) |
| :--- | :--- | :--- |
| **Keyword** | `lock.wait()`, `sleep()` | `await` |
| **Thread State** | **Blocked** (Idle, wasting CPU/RAM) | **Freed** (Working on other tasks) |
| **System Impact** | Can cause thread explosion | Constant thread count (Efficient) |
| **Resumption** | Same thread | potentially different thread |
| **Context** | Stack-based | Heap-allocated state |

## Answer 29
## Q: 结构化并发：什么是“子任务”关系？如果父任务被取消，子任务会发生什么？

🧠 Memory Answer (Quick Recall Layer)
**Structured Concurrency** means tasks follow a strict hierarchy (Parent-Child). If a parent task is cancelled, the system automatically cancels all its **child tasks**.
**Recall Hook:** "The tree dies together. If the root is cut, the branches fall."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Uses syntax like `async let` or `TaskGroup`. The parent function cannot return until all children have completed or thrown.
*   **Example Anchor:**
    ```swift
    func loadProfile() async {
        async let image = downloadImage() // Child
        async let bio = downloadBio()     // Child
        // If 'loadProfile' is cancelled here, 'image' and 'bio' are cancelled too.
        _ = await (image, bio)
    }
    ```
*   **Pitfall:** Using `Task { }` (Unstructured) inside a function. This breaks the link; if the function is cancelled/returns, the `Task` keeps running (zombie task).
*   **Boundary:** `Task.detached` is also unstructured.

---

🧩 Structured Summary
**Template: T3 Concept Card (Structured Concurrency)**

*   **Definition:** Managing task lifecycles using lexical scope.
*   **Key Rules:**
    1.  **Hierarchy:** Children live only as long as parents.
    2.  **Error Propagation:** If a child throws, the parent sees it (and can cancel siblings).
    3.  **Cancellation:** Parent cancel -> Child cancel.
*   **Tools:** `async let`, `withTaskGroup`.
*   **Anti-Pattern:** "Fire-and-forget" tasks without tracking handles (memory leaks).

## Answer 30
## Q: 异步 let：async let 如何实现并行执行？它与顺序等待两个函数有何不同？

🧠 Memory Answer (Quick Recall Layer)
`async let` spawns a child task in the background **immediately** but allows the code execution to continue until the value is actually needed (awaited). This overlap creates parallelism.
**Recall Hook:** "Launch now, wait later."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:**
    *   **Sequential:** `let a = await f1(); let b = await f2()` (Total time = T1 + T2).
    *   **Concurrent:** `async let a = f1(); async let b = f2(); _ = await (a, b)` (Total time = Max(T1, T2)).
*   **Example Anchor:**
    ```swift
    // Starts BOTH downloads at the same time
    async let user = fetchUser()
    async let settings = fetchSettings()
    // Waits here for both to finish
    return try await UserViewModel(user: user, settings: settings)
    ```
*   **Pitfall:** Awaiting immediately on the definition line: `let x = await fetch()`. This is sequential. You must use `async let` to defer the await.
*   **Boundary:** Cannot be used for a variable number of tasks (use `TaskGroup` for arrays of tasks).

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Sequential vs Concurrent)**

*   **Use Sequential (`await func()`) when:**
    *   Step B depends on the result of Step A (e.g., login, *then* fetch profile).
*   **Use `async let` when:**
    *   Fixed number of tasks (e.g., 2 or 3) are independent.
    *   You want to run them in parallel to save time.
*   **Use `TaskGroup` when:**
    *   Dynamic number of tasks (e.g., downloading list of images).

## Answer 31
## Q: 任务优先级：Swift 并发如何处理优先级继承？

🧠 Memory Answer (Quick Recall Layer)
Swift Tasks automatically inherit the **Priority** (`TaskPriority`) of the context that created them. This prevents "Priority Inversion" where a high-priority task gets stuck waiting for a low-priority child.
**Recall Hook:** "Children inherit the urgency of their parents."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:**
    *   `.userInteractive` (UI)
    *   `.userInitiated` (Data)
    *   `.utility`
    *   `.background`
*   **Example Anchor:** If you are inside a `.userInitiated` task and call `async let child = doWork()`, the `child` task runs at `.userInitiated`.
*   **Pitfall:** Spawning a `Task { }` from `viewDidLoad` (Main Thread) inherits `.userInteractive` (highest). If you do heavy math there, you might starve the UI. **Fix:** `Task(priority: .background) { ... }`.
*   **Boundary:** `Task.detached` does **not** inherit priority.

---

🧩 Structured Summary
**Template: T3 Concept Card (Task Priority)**

*   **Rule:** Priority propagates down the tree.
*   **Purpose:** Ensures the Scheduler picks the right job to run on the CPU.
*   **Override:** You can explicitly set `Task(priority: .background)`.
*   **Escalation:** If a high-priority task awaits a low-priority handle, the system **boosts** the low task to match the high one temporarily.

## Answer 32
## Q: 分离任务：什么时候应该使用分离任务（Task.detached）而不是标准的 Task { }？（除非必要否则应避免，因为它会破坏上下文继承）。

🧠 Memory Answer (Quick Recall Layer)
Use `Task.detached` **only** when you specifically want to break the connection to the current context (Actors, Priority, Locals). Usually, standard `Task { }` is preferred to maintain safety.
**Recall Hook:** "Task { } stays home; Detached leaves the family."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:**
    *   `Task { }`: Inherits `@MainActor`, Priority, and Task-Local Values.
    *   `Task.detached { }`: Starts fresh. Runs on generic background pool.
*   **Example Anchor:**
    *   **Use Case:** A Logger service. You tap a button (MainActor), but the logging logic shouldn't block the UI and doesn't need to be on Main. `Task.detached { logger.save() }`.
*   **Pitfall:** Using `Task.detached` to update UI. It is not on MainActor, so you must `await MainActor.run` inside it.
*   **Prevention:** Default to `Task { }`. Use `detached` only for "pure background" work completely unrelated to the UI view.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Task vs Detached)**

*   **Use `Task { }` (Unstructured) when:**
    *   Starting async work from synchronous code (e.g., `Button.action`).
    *   You want to keep the current Actor (e.g., stay on Main Thread).
*   **Use `Task.detached` when:**
    *   The work is completely independent of the UI or current actor.
    *   You explicitly want to execute on a background thread (avoiding MainActor contention).
    *   Implementing a "fire-and-forget" background loop.

## Answer 33
## Q: 主执行者：为什么我们要给 ViewModel 标注 @MainActor？如果后台任务尝试更新 MainActor 类中的属性会发生什么？

🧠 Memory Answer (Quick Recall Layer)
Annotating a ViewModel with **`@MainActor`** guarantees all its properties and methods run on the **Main Thread**. If a background task updates a property, the compiler inserts a check (or error) to ensure safety.
**Recall Hook:** "The ViewModel drives the UI; the UI lives on Main; so the ViewModel lives on Main."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `@MainActor` is a global actor singleton wrapping the main thread.
*   **Example Anchor:**
    ```swift
    @MainActor class ViewModel: ObservableObject {
        @Published var state = "Idle"
        func update() { state = "Active" } // Safe
    }
    ```
*   **Safety:** If you try `await task { vm.state = "new" }` (from background), the compiler forces you to `await` the assignment because it involves hopping to the Main Actor.
*   **Pitfall:** Swift 5.x sometimes warned; Swift 6 is strict. A background loop updating a `@Published` var without `await` causes a crash or race condition if not protected.

---

🧩 Structured Summary
**Template: T3 Concept Card (MainActor)**

*   **Definition:** A Global Actor that serializes work on the Main Thread.
*   **Usage:**
    *   Classes: `@MainActor class MyVM ...` (Entire class protected).
    *   Funcs: `@MainActor func updateUI()`.
*   **Why:** `ObservableObject` publishers trigger UI redraws. UI updates **must** be on Main Thread.
*   **Compiler Action:**
    *   Internal calls: Sync.
    *   External calls: Async (must `await`).

## Answer 34
## Q: 延续性：如何将基于代理的遗留 API（如 CoreLocation）封装到异步流中？（使用 withCheckedContinuation）。

🧠 Memory Answer (Quick Recall Layer)
Use **`withCheckedContinuation`** to pause the async task, then call **`continuation.resume(returning:)`** inside the legacy callback/delegate to wake it up.
**Recall Hook:** "Pause the async world, wait for the callback legacy, resume the world."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Creates a bridge. The task suspends. You get a `continuation` object. You MUST call resume exactly once.
*   **Example Anchor:**
    ```swift
    func fetchLocation() async throws -> Location {
        return try await withCheckedThrowingContinuation { continuation in
            locationManager.requestLocation { loc, error in
                if let loc = loc { continuation.resume(returning: loc) }
                else { continuation.resume(throwing: error!) }
            }
        }
    }
    ```
*   **Pitfall:**
    1.  **Forgetting to resume:** Task hangs forever (leak).
    2.  **Resuming twice:** Crash (`CheckedContinuation` catches this).
*   **Boundary:** `AsyncStream` is used for Delegate callbacks that happen *multiple* times (like location updates), whereas Continuation is for *one-shot* results.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Wrapping Legacy Code)**

1.  **Define:** `func modern() async -> T`.
2.  **Wrap:** Call `return await withCheckedContinuation { c in ... }`.
3.  **Call Legacy:** Inside the block, trigger the old API.
4.  **Handle Callback:** Inside the old callback (`completion: (T?)`), unwrap data.
5.  **Resume:** Call `c.resume(returning: value)`.
6.  **Verify:** Ensure every path (success/error) calls resume EXACTLY once.

## Answer 35
## Q: Actor 隔离：Actor 是如何防止数据竞争的？它是锁吗？（它是一个序列化器）。

🧠 Memory Answer (Quick Recall Layer)
An **Actor** is a reference type that protects its mutable state by **serializing** access. It acts like a class with a built-in serial queue (mailbox), ensuring only one task interacts with it at a time.
**Recall Hook:** "Actors are like single-lane bridges; cars (tasks) must wait their turn."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Internally, it manages a queue of tasks. You must use `await` to enter the actor because you might have to wait in line.
*   **Example Anchor:**
    ```swift
    actor BankAccount {
        var balance = 100
        func deposit(amount: Int) { balance += amount } // Safe!
    }
    ```
*   **Pitfall:** Accessing an actor's `var` property from outside without `await`. The compiler prevents this.
*   **Boundary:** Unlike a `Lock` (which blocks threads), an Actor **suspends** the caller (yielding the thread) while waiting.

---

🧩 Structured Summary
**Template: T3 Concept Card (Actor Isolation)**

*   **Definition:** A thread-safe reference type using partial synchronization.
*   **Key Feature:** **Data Isolation**. Mutable state is private to the actor's "executor".
*   **Access Rule:**
    *   **Inside:** Synchronous access (`self.balance`).
    *   **Outside:** Asynchronous access (`await account.balance`).
*   **Vs Lock:**
    *   **Lock:** Blocks thread (expensive).
    *   **Actor:** Suspends task (efficient).

## Answer 36
## Q: 重入性：如果一个 Actor 函数在 await 处暂停，其他任务可以进入该 Actor 吗？（可以）。你如何处理暂停期间的状态变化？

🧠 Memory Answer (Quick Recall Layer)
**Actor Reentrancy** means that when an actor function suspends (`await`), the actor **releases its lock**, allowing other tasks to enter and modify state before the original function resumes.
**Recall Hook:** "When you await, you open the gate."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Reentrancy prevents deadlocks (actor A waiting for B, B waiting for A). However, it introduces logical races.
*   **Example Anchor:**
    ```swift
    func buy() async {
        if balance > 10 { // Check
            await verify() // Suspend! -> Someone else might set balance to 0 here.
            balance -= 10 // BUG: Balance might be negative now.
        }
    }
    ```
*   **Fix:** **Check-Suspend-Recheck**. After every `await`, assume the world has changed. Or, perform mutations synchronously before/after the suspension.

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Actor Reentrancy)**

*   **Symptom:** Inconsistent state, "Impossible" bugs (e.g., negative balance despite check).
*   **Cause:** Assuming state is preserved across an `await` call.
*   **Fix:**
    1.  **Re-check:** `if balance > 10 { await ...; if balance > 10 { balance -= 10 } }`.
    2.  **Snapshot:** Capture values before await if needed (`let amount = self.amount`).
*   **Rule:** An Actor guarantees thread safety (no crash), NOT logical transaction safety (correctness) across awaits.

## Answer 37
## Q: 非隔离：什么时候会将 Actor 内部的属性或函数标记为 nonisolated？

🧠 Memory Answer (Quick Recall Layer)
Use **`nonisolated`** to make a method or property accessible from **any thread** without `await`. This is safe only if it does not read/write mutable actor state (e.g., constants or computed props based on constants).
**Recall Hook:** "Nonisolated means 'Public Park' - anyone can enter without a key."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The compiler treats the marked member as if it were outside the actor. It cannot access `self`'s mutable vars.
*   **Example Anchor:**
    ```swift
    actor User {
        let id: Int // Constant (Safe)
        var name: String // Mutable (Unsafe)
        
        nonisolated func description() -> String {
            return "User \(id)" // OK: id is let.
            // return name ❌ Compiler Error
        }
    }
    ```
*   **Usage:** Conforming to protocols like `CustomStringConvertible` or `Hashable` which require synchronous/non-async requirements.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Using nonisolated)**

*   **Use when:**
    *   Conforming to a synchronous protocol (`Hashable`, `Equatable`, `Codable`).
    *   Reading `let` constants (immutable state).
    *   The function logic is purely functional (depends only on arguments).
*   **Avoid when:**
    *   You need to read or write `var` properties.
    *   The logic requires thread protection.

## Answer 38
## Q: Sendable 协议：哪些类型是隐式 Sendable 的？为什么标准类不是 Sendable 的？

🧠 Memory Answer (Quick Recall Layer)
**`Sendable`** is a thread-safety marker. Value types (Structs/Enums) are implicitly Sendable if their contents are Sendable. **Classes** are NOT Sendable by default because they are reference types with mutable state (sharing a pointer across threads is unsafe).
**Recall Hook:** "Sendable = Safe to Share."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The compiler checks `Sendable` conformance. Passing a non-Sendable type across an isolation boundary (e.g., into an `actor` or `Task`) emits a warning (Swift 5) or error (Swift 6).
*   **Implicitly Sendable:**
    *   `Int`, `String`, `Bool`.
    *   `struct` / `enum` composed of Sendable types.
    *   `actor` (protects itself).
*   **Class Condition:** A class is Sendable only if it is `final`, holds only immutable storage (`let`), and that storage is Sendable.

---

🧩 Structured Summary
**Template: T3 Concept Card (Sendable Protocol)**

*   **Definition:** A marker protocol (`protocol Sendable {}`) indicating thread safety.
*   **Goal:** Prevent Data Races at compile time.
*   **Where it applies:**
    *   Closures passed to `Task { }`.
    *   Arguments passed to `actor` methods.
*   **How to make Class Sendable:**
    1.  Make it `final`.
    2.  Make all properties `let`.
    3.  Ensure all properties are `Sendable`.
    *   *OR* Use `@unchecked Sendable` (Manual locking).

## Answer 39
## Q: @unchecked Sendable：什么时候可以绕过编译器的安全检查？

🧠 Memory Answer (Quick Recall Layer)
**`@unchecked Sendable`** tells the compiler to disable thread-safety checks for a type. Use it ONLY when you have implemented **manual thread safety** (e.g., using a Lock or Queue) that the compiler cannot analyze.
**Recall Hook:** "I swear I locked the door manually."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It adopts `Sendable` but suppresses compiler diagnostics. It is an "escape hatch".
*   **Example Anchor:**
    ```swift
    class ThreadSafeCache: @unchecked Sendable {
        private var cache = [String: Data]()
        private let lock = NSLock()
        
        func get(_ key: String) -> Data? {
            lock.lock(); defer { lock.unlock() }
            return cache[key]
        }
    }
    ```
*   **Pitfall:** Using it just to silence warnings without adding locks. This leads to crashes in production.
*   **Boundary:** Often needed when wrapping C-pointers or legacy Objective-C classes that are thread-safe by documentation but not by type system.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (@unchecked Sendable)**

*   **Use when:**
    *   You are wrapping a legacy class that uses internal locks.
    *   You are using `OSAllocatedUnfairLock` or `DispatchQueue` to protect state.
    *   The compiler assumes unsafe, but you know logic guarantees safety (e.g., write-once).
*   **Avoid when:**
    *   You just want to get rid of a warning. (Fix the code instead!).
    *   The type is a plain mutable class.

## Answer 40
## Q: 线程爆炸：为什么创建 100 个 DispatchQueue 很糟糕，但创建 1000 个 Task 通常没问题？

🧠 Memory Answer (Quick Recall Layer)
**Thread Explosion** occurs in GCD because each blocked `DispatchQueue` spawns a real OS thread (expensive memory/context switch). **Swift Concurrency Tasks** are lightweight objects multiplexed onto a small, fixed number of threads (Cooperative Pool), so thousands can exist cheaply.
**Recall Hook:** "Threads are heavy trucks; Tasks are light packages on those trucks."

---

📘 Core Explanation (Understanding Layer)
*   **GCD Problem:** If you block a thread (e.g., `semaphore.wait()`), GCD spins up a new thread to keep the CPU busy. Doing this 100 times means 100 threads = ~100MB RAM + scheduler thrashing.
*   **Swift Solution:** `await` yields the thread. The "blocked" task is saved to the heap, and the thread picks up the next task. 1000 waiting tasks = 0 blocked threads.
*   **Pitfall:** Calling blocking C-APIs inside Swift Concurrency. This blocks one of the few shared pool threads, causing starvation.

---

🧩 Structured Summary
**Template: T2 Compare Table (GCD vs Swift Concurrency)**

| Aspect | GCD Queues | Swift Tasks |
| :--- | :--- | :--- |
| **Mapping** | 1 Queue ≈ 1+ Threads (Dynamic) | M Tasks : N Threads (Fixed) |
| **Blocking** | Blocks the Thread | Suspends the Task |
| **Cost** | High (Stack + Kernel) | Low (Heap allocation) |
| **Limit** | System limit (Thread Explosion) | RAM limit (Millions) |
| **Deadlock** | Easy (Sync on current queue) | Rare (Forward progress guarantee) |

## Answer 41
## Q: 协作线程池：Swift 并发使用多少个线程？（大致等于核心数量）。

🧠 Memory Answer (Quick Recall Layer)
The **Cooperative Thread Pool** spawns roughly as many threads as there are **CPU cores** (e.g., 6-8 on iPhone). This optimizes efficiency by eliminating context switching overhead.
**Recall Hook:** "One thread per core keeps the scheduler from doing a chore."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** P-cores (Performance) and E-cores (Efficiency) have separate pools. The runtime attempts to keep every core 100% busy with exactly one thread.
*   **Constraint:** Since the pool is fixed, you **must not** block these threads. If you block them all, the app hangs.
*   **Example Anchor:** On a 4-core device, running 4 `while true` loops (without `await`) will freeze the entire concurrency system.
*   **Fix:** Use `Task.yield()` in long loops to voluntarily give up the core.

---

🧩 Structured Summary
**Template: T3 Concept Card (Cooperative Thread Pool)**

*   **Definition:** A fixed-width pool of worker threads managed by the Swift Runtime.
*   **Size:** ~Number of Logical Cores.
*   **Golden Rule:** **Forward Progress**. Threads must always be moving towards completion or yielding.
*   **Violation:** `sleep()`, `lock.lock()`, or intense calculation without yielding blocks the cooperative contract.

## Answer 42
## Q: 竞态条件：在使用 async/await 时仍可能出现竞态条件吗？（是的，逻辑竞态 vs 数据竞态）。

🧠 Memory Answer (Quick Recall Layer)
**Yes.** Actors prevents **Data Races** (memory corruption), but they do NOT prevent **Logical Race Conditions** (ordering bugs). Events can still happen in an unexpected order.
**Recall Hook:** "The memory is safe, but the logic might still be confused."

---

📘 Core Explanation (Understanding Layer)
*   **Data Race (Solved):** Two threads writing to memory at the exact same nanosecond. Actors stop this.
*   **Logic Race (Unsolved):**
    *   Task A reads `score` (10).
    *   Task B reads `score` (10).
    *   Task A writes `11`.
    *   Task B writes `11`.
    *   **Result:** Score is 11, should be 12.
*   **Example Anchor:** If you `await` inside a function, the state might change before you resume. "High level" atomicity is lost.
*   **Fix:** Encapsulate the entire transaction in a synchronous actor method, or re-check state after `await`.

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Logical Races)**

*   **Symptom:** Lost updates, wrong order of operations.
*   **Cause:** Interleaving tasks at suspension points.
*   **Scenario:**
    ```swift
    let current = state
    await save() // SUSPEND
    // 'state' might have changed by another task here!
    state = current + 1 // Clobbers new state
    ```
*   **Prevention:** Mutation should happen synchronously if possible. Do not hold state in local variables across awaits if that state is shared.

## Answer 43
## Q: 任务让步：什么时候可能需要手动让出一个长时间运行的任务？

🧠 Memory Answer (Quick Recall Layer)
Call **`await Task.yield()`** when performing a long, CPU-intensive operation (like image filtering or parsing) to voluntarily give the thread back to the scheduler, preventing UI starvation.
**Recall Hook:** "Take a breath, let others speak."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It creates a suspension point. The task goes to the back of the line. The thread picks up the next task (which might be a UI update or higher priority item).
*   **Example Anchor:**
    ```swift
    for item in hugeList {
        process(item)
        if item.isMultiple(of: 100) {
            await Task.yield() // Be nice
        }
    }
    ```
*   **Pitfall:** Yielding too often (every iteration) kills performance due to suspension overhead. Yielding never causes hangs.
*   **Boundary:** Yielding doesn't guarantee *someone else* will run, it just offers the chance.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Task.yield)**

*   **Use when:**
    *   Looping over large datasets (1000+ items).
    *   Performing heavy math/compression on a background task.
    *   You suspect your background task is blocking the Main Thread (priority inversion).
*   **Avoid when:**
    *   The task is short (< 1ms).
    *   You are already `await`ing network/disk calls (inherently yields).

## Answer 44
## Q: 异步序列：如何遍历数据流（如通知或 WebSocket）？

🧠 Memory Answer (Quick Recall Layer)
Use **`AsyncSequence`**. Iterate using **`for try await item in sequence`**. It processes values one by one as they arrive over time.
**Recall Hook:** "It's a for-loop, but it waits for each item."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Like `IteratorProtocol`, but `next()` is `async`.
*   **Example Anchor:**
    *   **File:** `for try await line in url.lines { ... }`
    *   **Notifications:** `for await note in NotificationCenter.default.notifications(...) { ... }`
    *   **Stream:** `AsyncStream` allows building custom sequences.
*   **Pitfall:** Breaking the loop cancels the iterator. If the sequence is infinite (WebSocket), the loop never ends (blocks code below it). Wrap in `Task { }` if you need to continue.

---

🧩 Structured Summary
**Template: T3 Concept Card (AsyncSequence)**

*   **Definition:** A protocol for values delivered over time.
*   **Syntax:** `for await x in stream`.
*   **Common Types:**
    *   `AsyncStream` (Custom logic).
    *   `URLSession.bytes` (Download progress).
    *   `NotificationCenter.notifications`.
*   **Cancellation:** Implicit. If the loop breaks or the parent task cancels, the stream terminates.

## Answer 45
## Q: 全局 Actor：除了主线程，@GlobalActor 属性在什么场景下有用？（例如 DatabaseActor）。

🧠 Memory Answer (Quick Recall Layer)
**`@GlobalActor`** allows creating a **shared, named isolation domain** (singleton actor) that multiple independent types can adopt to synchronize access to a specific resource (like a Database or Audio Engine).
**Recall Hook:** "Like @MainActor, but for your own subsystems."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It creates a singleton Actor. Any class/func marked with the attribute runs on that actor's serial executor.
*   **Example Anchor:**
    ```swift
    @globalActor actor DatabaseActor {
        static let shared = DatabaseActor()
    }
    
    @DatabaseActor class UserRepository { ... }
    @DatabaseActor func save() { ... }
    ```
*   **Benefit:** `UserRepository` and `save()` share the **same** lock/context, preventing races between them, even if they are in different files.
*   **Use Case:** Serializing access to SQLite, Core Bluetooth, or a USB accessory.

---

🧩 Structured Summary
**Template: T3 Concept Card (Global Actors)**

*   **Definition:** A custom singleton actor for enforcing global thread safety on a subsystem.
*   **Built-in:** `@MainActor` is the system-provided global actor.
*   **Syntax:** `@globalActor actor Name { static let shared = Name() }`.
*   **Usage:** Apply `@Name` to classes, properties, or functions.
*   **Result:** All annotated code runs sequentially on that actor. No data races between them.

## Answer 46
## Q: MVVM (Model-View-ViewModel): 趋势：MVVM 在 SwiftUI 中有何变化？（使用 Observable 宏对比 Bindings）。输入/输出：如何构建 ViewModel 以严格定义输入（用户意图）和输出（状态）？

🧠 Memory Answer (Quick Recall Layer)
**MVVM** separates UI (View) from business logic (ViewModel). In modern SwiftUI, the `@Observable` macro simplifies this by removing `@Published` overhead. Ideally, define strict **Input** (Enums/Methods) and **Output** (State properties) interfaces.
**Recall Hook:** "View = Face, ViewModel = Brain. Keep them connected but distinct."

---

📘 Core Explanation (Understanding Layer)
*   **Trend:** Traditional MVVM (Combine `@Published`) is shifting to **Observation** (Macro). This allows Views to track specific fields, not the whole object, reducing over-invalidation.
*   **Input/Output:**
    *   **Input:** `enum Action { case load, tapButton }` passed to `func trigger(_ action: Action)`.
    *   **Output:** `enum State { case idle, loading, error(String) }`.
*   **Example Anchor:** `viewModel.trigger(.login)` -> ViewModel updates `state = .loading` -> View shows Spinner.
*   **Pitfall:** Putting UI code (`import UIKit`) in the ViewModel. This breaks testability.

---

🧩 Structured Summary
**Template: T3 Concept Card (Modern MVVM)**

*   **Role:** Mediator between Data and UI.
*   **SwiftUI Evolution:**
    *   **Old:** `ObservableObject` + `@Published` (Object-level invalidation).
    *   **New (Swift 5.9+):** `@Observable` (Field-level tracking).
*   **Strict IO Pattern:**
    *   **Input:** Function calls or Intents.
    *   **Output:** Single Source of Truth state variable.
*   **Benefit:** Unit Test the logic without building a View.

## Answer 47
## Q: 协调者模式：原因：这如何解决“庞大的视图控制器”导航问题？SwiftUI：协调者模式在 SwiftUI 中过时了吗？（没有，通常被 NavigationStack 路由替换或增强）。

🧠 Memory Answer (Quick Recall Layer)
**Coordinators** extract navigation logic from ViewControllers, preventing hard dependencies between screens (A pushes B). In SwiftUI, this evolves into a **Router** object managing a `NavigationPath`.
**Recall Hook:** "Don't let Views drive the bus (navigation); hire a Coordinator driver."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Instead of `navigationController.pushViewController(...)`, the VC calls `coordinator.showDetails()`. The Coordinator decides *what* to show.
*   **Example Anchor:**
    *   **UIKit:** `AppCoordinator` holds the `window` and swaps root VCs.
    *   **SwiftUI:** `class Router: ObservableObject { @Published var path = NavigationPath() }`.
*   **SwiftUI Status:** Not dead. `NavigationStack` needs a state object to drive deep linking and programmatic navigation. That state object IS the Coordinator/Router.
*   **Pitfall:** Massive Coordinator. Use child coordinators (TabCoordinator, SettingsCoordinator) to split logic.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Coordinator/Router)**

1.  **Extract:** Remove `NavigationLink` destinations from View body.
2.  **State:** Create a class `Router` holding `[RouteEnum]`.
3.  **Inject:** Pass `Router` to the View environment.
4.  **Action:** View calls `router.navigate(to: .detail)`.
5.  **Resolve:** `NavigationStack(path: $router.path)` uses `.navigationDestination` to map Enum -> View.
6.  **Benefit:** You can now deeply link to any screen by just modifying the array.

## Answer 48
## Q: 单例（反模式？）：用法：什么时候单例是可以接受的（如 URLSession.shared），什么时候它是负担（测试）？优化：如何重构单例以支持依赖注入？

🧠 Memory Answer (Quick Recall Layer)
**Singletons** are acceptable for "Ambient Context" (immutable/global services like `URLSession.shared`), but bad for **Mutable State** or Logic because they make testing impossible (cannot mock).
**Recall Hook:** "Singleton is a global variable in a fancy hat. Use sparingly."

---

📘 Core Explanation (Understanding Layer)
*   **Acceptable:** Logging, Analytic configuration, default system handles.
*   **Liability:** `AuthManager.shared.login()`. If you write a test, you can't mock the network call. Parallel tests might clobber shared state.
*   **Refactoring (DI):**
    *   **Step 1:** Create a Protocol `AuthService`.
    *   **Step 2:** Make Singleton conform.
    *   **Step 3:** Inject Protocol. `init(auth: AuthService = AuthManager.shared)`.
*   **Example Anchor:** `class ViewModel { init(api: API = .shared) }`. Tests can pass `MockAPI()`.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Using Singleton)**

*   **Use when:**
    *   The object is truly unique (File System, Main Bundle).
    *   It effectively acts as a constant service (`URLSession.shared`).
*   **Avoid when:**
    *   It holds mutable state (User Session) that changes during tests.
    *   It performs side effects (Network, Database) you need to mock.
*   **Refactor:** Always prefer **Dependency Injection** (default parameter injection) over direct access.

## Answer 49
## Q: 工厂模式：在使用“面向协议编程”时，这有何帮助？（隐藏具体类型）。

🧠 Memory Answer (Quick Recall Layer)
The **Factory Pattern** encapsulates object creation. In Swift (POP), it allows returning a Protocol type (e.g., `Device`) while hiding the concrete implementation (`iPhone` vs `iPad`), enabling loose coupling.
**Recall Hook:** "Order a 'Car', don't worry if the factory makes a Ford or a Tesla."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** A static method or class that returns a type conforming to a Protocol.
*   **Example Anchor:**
    ```swift
    protocol Network { func fetch() }
    class NetworkFactory {
        static func make() -> Network {
            #if DEBUG
            return MockNetwork()
            #else
            return RealNetwork()
            #endif
        }
    }
    ```
*   **Benefit:** The consuming code doesn't know about `MockNetwork`. It just calls `fetch()`. This makes swapping implementations (A/B testing, feature flags) trivial.
*   **SwiftUI:** `some View` is basically a factory result (Opaque Type) built into the language.

---

🧩 Structured Summary
**Template: T3 Concept Card (Factory Pattern)**

*   **Definition:** Abstraction for instantiating objects.
*   **Key Benefit:** Decouples creation logic from business logic.
*   **POP Synergy:** Returns `Protocol` types instead of concrete classes.
*   **Use Case:**
    *   Dependency Injection containers.
    *   Feature flagging (Return different implementation based on config).
    *   Cross-platform code (iOS vs Mac implementations).

## Answer 50
## Q: 建造者模式：我们在 Swift 的哪些地方能看到这种模式？（SwiftUI 的 ViewBuilder 和声明式语法）。

🧠 Memory Answer (Quick Recall Layer)
The **Builder Pattern** constructs complex objects step-by-step. Swift's **Result Builders** (`@ViewBuilder`) implement this natively, allowing the declarative DSL syntax of SwiftUI.
**Recall Hook:** "SwiftUI is the ultimate Builder: Stack { View; View } -> TupleView."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `ResultBuilder` transforms a sequence of statements into a single nested object.
*   **Example Anchor:**
    *   **Classic:** `AlertBuilder().setTitle("Hi").setMessage("Msg").build()`.
    *   **SwiftUI:**
        ```swift
        VStack { // Uses @ViewBuilder
            Text("A")
            Image("B")
        } // Returns TupleView<(Text, Image)>
        ```
*   **Why:** Removes the noise of `addSubview`, `array.append`, and comma-separated lists.
*   **Usage:** You can create custom builders for configuring rich text, SQL queries, or complex configuration objects.

---

🧩 Structured Summary
**Template: T2 Compare Table (Classic vs Result Builder)**

| Aspect | Classic Builder (ObjC/Java style) | Swift Result Builder (@ViewBuilder) |
| :--- | :--- | :--- |
| **Style** | Imperative / Chained | Declarative DSL |
| **Syntax** | `.setX().setY().build()` | `{ X; Y }` |
| **Compiler** | Standard method calls | Abstract Syntax Tree transformation |
| **Flexibility** | Good for config objects | Excellent for Hierarchies/Trees |
| **Example** | `URLComponents` | `SwiftUI.Body`, `RegexBuilder` |

## Answer 51
## Q: 装饰器/包装器：Swift 的属性包装器（@State, @Published）是如何充当装饰器模式的？

🧠 Memory Answer (Quick Recall Layer)
The **Decorator Pattern** adds behavior to an object without changing its class. Swift **Property Wrappers** (`@propertyWrapper`) are a native implementation, wrapping a value to add logic like storage, validation, or observation (e.g., `@State` triggers UI updates).
**Recall Hook:** "A Property Wrapper is a Decorator for your variables."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The wrapper struct encapsulates the value (`wrappedValue`) and adds logic in the `get/set` accessors.
*   **Example Anchor:**
    ```swift
    @State private var count = 0
    // Actually creates: var _count: State<Int>
    ```
    Writing to `count` talks to `_count`, which notifies SwiftUI to redraw.
*   **Pitfall:** Attempting to use SwiftUI-specific wrappers like `@State` inside a standard `class` (ViewModel). This fails because `@State` relies on the View struct's lifecycle and won't trigger updates as expected.
*   **Fix:** Use `@Published` (within an `ObservableObject`) or the `@Observable` macro for reference types to ensure proper state propagation.
*   **Boundary:** Property wrappers cannot be applied to `lazy`, `weak`, or `unowned` properties. They also cannot be used on local variables in most contexts.

---

🧩 Structured Summary
**Template: T3 Concept Card (Property Wrappers as Decorators)**

*   **Definition:** Types that encapsulate read/write logic for another value.
*   **Decorator role:** Adds "side effects" (persistence, observation) to simple assignments.
*   **Examples:**
    *   `@State`: Decorates with Heap storage + View invalidation.
    *   `@UserDefault`: Decorates with UserDefaults read/write.
*   **Common Misconception:** Thinking `@State` works in classes. It is specifically tied to SwiftUI `View` value types.
*   **Pitfall:** Using `@State` in a class. **Fix:** Use `@Published` or `@Observable`.
*   **Exception:** Cannot be used with `lazy`, `weak`, or `unowned`.
    *   `@Clamped(0...10)`: Decorates with bounds checking.

## Answer 52
## Q: 外观模式：如何使用外观模式来隐藏复杂的遗留 C++ 库 or Core Audio 设置？

🧠 Memory Answer (Quick Recall Layer)
The **Facade Pattern** provides a simplified, unified interface to a complex set of classes. It hides "spaghetti code" or low-level APIs (like C/C++ pointers or Core Audio nodes) behind a clean, high-level Swift class.
**Recall Hook:** "The front of the building is pretty (Facade), hiding the messy pipes inside."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** A Wrapper Class (`AudioEngine`) that owns and coordinates the complex sub-components (`AVPlayerNode`, `AVAudioUnitTimePitch`, `AVAudioEngine`).
*   **Example Anchor:** In a high-performance audio app, instead of forcing every View to manage `AVAudioEngine` startup sequences and node attachments, use a `class VoiceRecorder` Facade with simple `start()` and `stop()` methods.
*   **Pitfall:** Creating a "God Object" Facade that attempts to wrap every single feature of the underlying library, eventually becoming just as complex as the system it tries to hide.
*   **Fix:** Follow the "YAGNI" (You Ain't Gonna Need It) principle; only expose the 20% of features that the app actually uses 80% of the time.
*   **Boundary:** Facades are less useful when the underlying API is already well-designed (like modern SwiftUI) or when low-level, fine-grained control is required for performance-critical tasks (e.g., raw Metal shader adjustments).

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Using Facade)**

*   **Use when:**
    *   Interacting with a complex library (Core Audio, Metal, OpenSSL).
    *   Wrapping legacy Objective-C/C++ code for Swift safety.
    *   You want to provide a "Simple" default configuration for other developers.
*   **Avoid when:**
    *   The underlying API is already high-level and intuitive.
    *   You need full access to every low-level configuration knob (Power Users).
*   **Rule of thumb:** "Simplify for the 80%, allow bypass for the 20%."
*   **Pitfall:** The "Leaky Abstraction" where the Facade requires the caller to still understand underlying types. **Fix:** Ensure the Facade return types are also simplified.
*   **Exception:** High-frequency rendering loops where Facade indirection might add unacceptable latency.

## Answer 53
## Q: 观察者模式：比较 KVO（旧）、NotificationCenter（松耦合）、Combine（响应式）和 Swift Observation（宏）。在 1 对多通信中你选择哪种？

🧠 Memory Answer (Quick Recall Layer)
**Observer Pattern** enables 1-to-Many communication. For modern apps (iOS 17+), **Swift Observation (@Observable)** is preferred for UI. **Combine** is for complex streams. **NotificationCenter** is for loose, system-wide events. **KVO** is legacy.
**Recall Hook:** "Observation for Views, Combine for Streams, Notifications for System."

---

📘 Core Explanation (Understanding Layer)
*   **Observation:** Compiler-generated tracking. Efficient. No disposables to manage.
*   **Combine:** Functional Reactive Programming (`map`, `filter`). Great for networking/input validation.
*   **NotificationCenter:** "Broadcasting". Good for "Keyboard Did Show" or "App Backgrounded", where sender and receiver don't know each other.
*   **Example Anchor:** In a "User Logout" scenario, use `NotificationCenter` to tell the Database, API, and UI layers to clear data simultaneously without them knowing each other's existence.
*   **Pitfall:** KVO (Key-Value Observing) is unsafe and crashes if the observer is deallocated before removal.
*   **Fix:** Use the modern `observe(_:options:handler:)` API introduced in Swift 4, which returns an `NSKeyValueObservation` object that automatically unregisters on deinit.
*   **Boundary:** Swift Observation (`@Observable`) only works for **Classes** and requires iOS 17+. For struct-based state or older OS support, you must still use `ObservableObject` (Combine) or `@State`.

---

🧩 Structured Summary
**Template: T2 Compare Table (Observer Variants)**

| Pattern | Best For | Pros | Cons |
| :--- | :--- | :--- | :--- |
| **Swift Observation** | SwiftUI State | Clean syntax, Performant | Requires Swift 5.9+, iOS 17+ |
| **Combine** | Data Streams | Powerful operators | Learning curve, Disposables |
| **NotificationCenter** | Global Events | Decoupled | Hard to debug flow |
| **KVO** | Legacy ObjC | Built-in to Cocoa | Unsafe, Verbose |
| **Delegate** | 1-to-1 | Explicit, Type-safe | Not 1-to-Many |

*   **Rule of thumb:** "Views observe; Streams combine; System notifies."
*   **Pitfall:** Strong reference cycles in `NotificationCenter` closures. **Fix:** Use `[weak self]` in the observation block.
*   **Exception:** For high-frequency game loops, avoid `NotificationCenter` due to overhead; use a direct observer list or delegate.

## Answer 54
## Q: 代理模式：为什么在许多 Apple 框架中，代理模式（1 对 1）仍优于闭包？（性能、避免循环引用、清晰的分离）。

🧠 Memory Answer (Quick Recall Layer)
**Delegates** define a formal Protocol for 1-to-1 communication. They are preferred over Closures for **complex interactions** (multiple events, return values) because they enforce structure, avoid retain cycles (weak ref), and are cleaner than 5 separate closures.
**Recall Hook:** "A Delegate is a contract; Closures are just sticky notes."

---

📘 Core Explanation (Understanding Layer)
*   **Clarity:** `UITableViewDelegate` has 30+ methods. Passing 30 closures to an initializer or as properties creates an unmanageable API surface.
*   **Cycle Safety:** Delegates are usually declared as `weak var delegate: Delegate?`. Closures capture their surrounding scope strongly by default, making strong reference cycles (like capturing `self` in a callback) a common source of memory leaks.
*   **Example Anchor:** In `UIScrollView`, the delegate pattern allows one object to respond to dozens of events (zooming, scrolling, deceleration) with zero risk of a retain cycle if the delegate is `weak`.
*   **Pitfall:** Forgetting to mark the delegate variable as `weak`. This creates a strong reference cycle where the `View` holds the `Delegate` and the `Delegate` (often a VC) holds the `View`.
*   **Fix:** Always define the delegate protocol as `AnyObject` and use `weak var delegate: MyDelegate?`.
*   **Boundary:** Delegates are strictly 1-to-1. If you need to notify 10 objects of a single event, use **NotificationCenter** or **Combine**.

---

🧩 Structured Summary
**Template: T2 Compare Table (Delegate vs Closure)**

| Aspect | Delegate | Closure / Callback |
| :--- | :--- | :--- |
| **Communication** | Protocol-based (Structured) | Function-based (Ad-hoc) |
| **Complexity** | Good for Many Events | Good for Single Event |
| **Memory** | `weak` (Safe default) | Captures scope (Cycle risk) |
| **Reusability** | High (Same object handles many) | Low (Inline logic) |
| **Boilerplate** | High (Protocol + Conformance) | Low (Just { code }) |

*   **Rule of thumb:** "Delegates for multi-method contracts; Closures for one-off results."
*   **Pitfall:** Strong reference cycle between Parent and Delegate. **Fix:** Use `weak var`.
*   **Exception:** When building SwiftUI-compatible components, closures are often preferred as they fit the declarative `@ViewBuilder` style better.

## Answer 55
## Q: 依赖注入 (DI): 技术：构造函数注入 vs 属性注入。容器：你需要像 Swinject 这样的库吗，还是可以自己构建一个简单的 DI 容器？

🧠 Memory Answer (Quick Recall Layer)
**Dependency Injection (DI)** provides objects with their dependencies (e.g., API Service) from the outside. **Constructor Injection** is best (guarantees readiness). Heavy containers (Swinject) are often overkill; a simple **Factory** or Composition Root is usually sufficient in Swift.
**Recall Hook:** "Pass it in, don't build it inside. Constructor is King."

---

📘 Core Explanation (Understanding Layer)
*   **Constructor Injection:** `init(service: Service)`. Guarantees the object is fully formed and usable. It also allows dependencies to be immutable (`let`).
*   **Property Injection:** `var service: Service!`. This is often required for Storyboards or XIBs where the system controls the initializer. It is riskier because the object might be accessed while the dependency is still `nil`.
*   **Example Anchor:** In a `ProfileViewModel`, inject a `NetworkService` protocol. This allows the production app to pass a `RealNetworkManager`, while unit tests pass a `MockNetworkManager`.
*   **Pitfall:** "Dependency Hell" in large projects where every class requires 10+ dependencies in its initializer.
*   **Fix:** Group related dependencies into a `struct AppDependencies` or use a **Service Locator** / **DI Container** to avoid passing a long list of parameters down 5 layers of the hierarchy.
*   **Boundary:** Swift's strong typing and lacks of robust runtime reflection make dynamic DI containers (like Swinject) slightly slower than manual injection. In performance-critical startup code, manual injection or a static container is preferred.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Refactoring to DI)**

1.  **Identify:** Find classes initializing their own dependencies (`let api = API()`).
2.  **Abstract:** Create a protocol `APIProtocol` to hide the concrete implementation.
3.  **Refactor:** Change the class to use `init(api: APIProtocol)`.
4.  **Inject:** At the "Composition Root" (e.g., `AppEntry` or `SceneDelegate`), create the concrete `API()` and pass it down.
5.  **Test:** Create `MockAPI` conforming to the protocol. Pass it to the ViewModel in tests to verify logic without network calls.
6.  **Verify:** Use a DI container or manual assembly to ensure all required dependencies are provided at startup.
7.  **Failure mode:** Circular dependencies (A needs B, B needs A). **Fix:** Use property injection or a lazy-initialized factory for one of the links.

*   **Rule of thumb:** "Constructor injection by default; Property injection for UIKit lifecycles."
*   **Exception:** For extremely deep view hierarchies in SwiftUI, use `@EnvironmentObject` instead of manual injection to avoid "Prop Drilling".
*   **Pitfall:** Over-abstracting everything into protocols before you actually need multiple implementations. **Fix:** Only create a protocol when you need to mock for tests or swap implementations.

## Answer 56
## Q: 基于区域的隔离：解释 Swift 6 中的“基于区域的隔离”。编译器如何证明在不使用锁的情况下跨线程传递非 Sendable 值是安全的？

🧠 Memory Answer (Quick Recall Layer)
**Region-based Isolation** is a Swift 6 compiler feature that analyzes data flow to prove a value is "disconnected" from its origin. If you pass a non-Sendable object to another thread and *never use it again* in the original thread, the compiler allows it safely.
**Recall Hook:** "If you give it away completely, you can't race with it."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The compiler tracks "regions" of isolation. If a value is freshly created or detached from all other references, it is in a "disconnected" region. This allows **transfer of ownership** across actor boundaries without a `Sendable` check.
*   **Example Anchor:**
    ```swift
    func process() {
        let user = User() // Non-Sendable class
        user.name = "A"
        // Swift 6: OK, because 'user' is not used after this line
        Task { print(user.name) }
    }
    ```
*   **Pitfall:** Attempting to access the variable *after* it has been transferred. This results in a compiler error.
*   **Fix:** Ensure the variable is "consumed" by the transfer (like passing it into a `Task` or an `actor` method) and not touched again in the current scope.
*   **Boundary:** This only works for values whose entire reference graph is disconnected. If the object holds a reference to another object still in use by the original thread, the isolation region is still "connected" and transfer is blocked.

---

🧩 Structured Summary
**Template: T3 Concept Card (Region-based Isolation)**

*   **Definition:** Compiler proof of exclusive access via Control Flow Analysis.
*   **Key Benefit:** Allows sending non-Sendable types across actor boundaries without data race risks.
*   **Requirement:** **Transfer of Ownership** (the source thread must stop using the object).
*   **Analogy:** Passing a physical baton. Only one runner can hold it at a time.
*   **New Error:** "Variable 'x' used after consume" occurs if you try to use it after sending.
*   **Exception:** Does not apply if the object is shared globally (e.g., in a global variable or singleton) because it cannot be "disconnected".
*   **Pitfall:** Creating "partial" transfers where only part of an object's graph is sent. **Fix:** Use `Sendable` for types that must be shared.

## Answer 57
## Q: 迁移工具：@preconcurrency import 和 @Sendable 有什么区别？在代码库迁移期间具体应何时使用它们？

🧠 Memory Answer (Quick Recall Layer)
**`@preconcurrency import`** silences warnings from external modules that haven't updated to modern concurrency yet. **`@Sendable`** is an attribute you apply to your own closures/types to enforce thread safety constraints manually.
**Recall Hook:** "Preconcurrency fixes *them*; Sendable fixes *us*."

---

📘 Core Explanation (Understanding Layer)
*   **`@preconcurrency import Lib`:** Tells Swift 6, "This library might not be thread-safe, but assume it is for now to avoid errors." It downgrades strict checks to dynamic checks or warnings for that specific module.
*   **`@Sendable`:** A constraint you add to function types (`(@Sendable () -> Void)`) or types themselves to indicate they are safe to cross isolation boundaries. It requires the closure to only capture safe (Sendable) data.
*   **Example Anchor:** Use `@preconcurrency import RealmSwift` when migrating to Swift 6 to prevent hundreds of "Realm objects are not Sendable" errors while the library is still in transition.
*   **Pitfall:** Overusing `@preconcurrency` to hide real data races in your own code. This only delays the problem and might hide bugs that crash in production.
*   **Fix:** Use it only for third-party libraries you don't control. For your own modules, fix the `Sendable` issues instead.
*   **Boundary:** `@preconcurrency` only works at the `import` level. It does not magically make the underlying code thread-safe; it just stops the compiler from complaining. You still need to ensure you aren't actually racing on those objects.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Migration Tools)**

*   **Use `@preconcurrency import` when:**
    *   You import a 3rd party library that triggers "Non-Sendable" warnings.
    *   You cannot modify the source code of that library to make it Sendable-compliant.
*   **Use `@Sendable` when:**
    *   You define a closure that will run on a background thread or be passed into a `Task`.
    *   You want the compiler to strictly check your closure for unsafe captures of mutable state.
*   **Goal:** Eventually remove `@preconcurrency` when libraries update to full Swift 6 concurrency support.
*   **Pitfall:** Silencing warnings for internal code that actually has data races. **Fix:** Use `@Sendable` and fix the underlying capture issues.
*   **Exception:** Some closures are implicitly `@Sendable` (like those passed to `Task { }`).


## Answer 58
## Q: 所有权转移：函数签名中的 sending（或 transferring）关键字如何工作？它如何允许你将非 Sendable 类实例移动到 Actor 中？

🧠 Memory Answer (Quick Recall Layer)
The **`sending`** (or `transferring`) keyword explicitly declares that the argument passed to the function is **consumed**. The caller gives up ownership, guaranteeing no other references exist, making it safe to move non-Sendable data into an Actor.
**Recall Hook:** "I am sending this to you; I promise I deleted my copy."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It enforces **Region-based Isolation** at the API boundary. The compiler verifies that the argument belongs to a "disconnected" memory region that can be safely handed off.
*   **Example Anchor:**
    ```swift
    func saveToDatabase(_ user: sending User) async { ... }
    // Caller:
    let u = User()
    await saveToDatabase(u)
    print(u) // ❌ Compiler Error: 'u' used after consume.
    ```
*   **Pitfall:** Attempting to `send` an object that is still referenced by other variables or is part of a larger, non-Sendable object graph.
*   **Fix:** Ensure the object being sent is newly created or that all other references to it have gone out of scope before the call.
*   **Boundary:** `sending` does not make the object `Sendable`. It only allows a one-time transfer. Once inside the `actor`, the object is again isolated and cannot be sent back unless the return type also uses `sending`.

---

🧩 Structured Summary
**Template: T3 Concept Card (sending Keyword)**

*   **Definition:** Parameter modifier indicating transfer of isolation region.
*   **Effect:** Caller loses access; Callee gains exclusive access to the memory region.
*   **Key Advantage:** Avoids expensive deep copies for non-Sendable types when transferring ownership.
*   **Compiler Rule:** Static analysis ensures the variable is "dead" in the calling scope after the call.
*   **Exception:** This cannot be applied to global variables or static properties since they cannot be "sent" out of their permanent scope.
*   **Common Misconception:** Thinking `sending` is the same as `@Sendable`. `sending` is for *transfer*, while `@Sendable` is for *sharing*.
*   **Pitfall:** Passing a property of `self` using `sending` if `self` is a class. **Fix:** Copy the data into a local variable first, then send it (if possible).


## Answer 59
## Q: 编译时安全：举一个在 Swift 5.10 中运行正常但在 Swift 6 中触发“数据竞争”编译错误的例子。编译器具体捕获了什么？

🧠 Memory Answer (Quick Recall Layer)
Swift 5.10 often issued warnings (or silence) for capturing mutable state in tasks. Swift 6 upgrades these to **Errors**, preventing compilation.
**Recall Hook:** "Swift 5 warned you; Swift 6 stops you."

---

📘 Core Explanation (Understanding Layer)
*   **Scenario:** Capturing a mutable class instance in a `Task`.
*   **Code:**
    ```swift
    class DataStore { var count = 0 } // Not Sendable
    func run() {
        let store = DataStore()
        Task { // Swift 6 Error: Capture of non-Sendable 'store'
            store.count += 1
        }
        store.count += 1 // Potential Race!
    }
    ```
*   **Analysis:** The compiler sees that `store` is accessible from both the `run()` function and the `Task` closure. Since `DataStore` is a non-Sendable class, the compiler cannot guarantee that both threads won't access `count` simultaneously.
*   **Pitfall:** Thinking that just because you "know" the code is safe (e.g., the Task runs *after* the function ends), it should compile. Swift 6 requires **proof** of safety.
*   **Fix:** Wrap the shared state in an **Actor**, make the class **Sendable** (if immutable), or use a thread-safe primitive like `OSAllocatedUnfairLock`.
*   **Boundary:** In Swift 6, **Region-based Isolation** might allow this *if* the compiler can prove `store` is never used again in `run()` after the `Task` is created. If you use `store` after the `Task`, it's an error.

---

🧩 Structured Summary
**Template: T2 Compare Table (Swift 5 vs 6 Safety)**

| Aspect | Swift 5.10 (Strict) | Swift 6 |
| :--- | :--- | :--- |
| **Non-Sendable Capture** | Warning | **Error** |
| **Global Variable** | Warning | **Error** (must be atomic/isolated) |
| **Safety Philosophy** | Informational | **Enforced** |
| **Inference** | Optimistic | Conservative |
| **Fix Strategy** | Silence warnings | Actors / Sendable / Locks |

*   **Rule of thumb:** "If the compiler can't prove it's safe, it's a bug."
*   **Exception:** `@preconcurrency import` can temporarily downgrade these errors back to warnings for external libraries.
*   **Pitfall:** Assuming `class` types are safe if they don't have many properties. **Fix:** Use `struct` for data models.


## Answer 60
## Q: 现代锁：在高性能 Swift 代码中，NSLock 被认为是过时的。什么是 OSAllocatedUnfairLock？为什么在保护小型、频繁访问的状态（如计数器）时，它比 Actor 更受青睐？

🧠 Memory Answer (Quick Recall Layer)
**`OSAllocatedUnfairLock`** is a low-overhead, struct-based lock (wrapping `os_unfair_lock`) available in modern Swift. It is preferred over **Actors** for tiny, frequent updates because it avoids the high cost of **Async Suspension** (heap allocation + context switch).
**Recall Hook:** "For a simple counter, a Lock is a light switch; an Actor is a bureaucracy."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** It's a "spinlock" that waits briefly in user space before sleeping. It is safer than the legacy `os_unfair_lock` because it is managed by the Swift runtime to avoid alignment issues.
*   **Performance:** `lock.withLock { i += 1 }` takes nanoseconds. Calling `await actor.increment()` involves allocating a Task, scheduling it, a context switch, and resumption—taking microseconds.
*   **Example Anchor:** In a high-frequency metrics tracker recording 1,000+ events per second, using an `Actor` would choke the system with task allocations. `OSAllocatedUnfairLock` keeps the latency minimal.
*   **Pitfall:** Holding the lock while performing a long-running or blocking operation (like network I/O). This blocks the thread completely, defeating the purpose of Swift's cooperative threading.
*   **Fix:** Use the lock ONLY for tiny, synchronous state updates. If you need to wait for I/O, use an `Actor`.
*   **Boundary:** `OSAllocatedUnfairLock` is available on iOS 16+ / macOS 13+. For older targets, you must use `os_unfair_lock` (with caution) or `NSLock`.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Actor vs Lock)**

*   **Use `Actor` when:**
    *   The protected logic is complex or asynchronous (uses `await`).
    *   Thread suspension is acceptable or desired to avoid blocking.
*   **Use `OSAllocatedUnfairLock` when:**
    *   Protecting simple, synchronous state (counters, flags, cache dictionaries).
    *   Performance is critical (e.g., inside a hot loop).
*   **Rule of thumb:** "Lock for speed; Actor for safety and async."
*   **Pitfall:** Blocking a thread with a lock. **Fix:** Keep lock scope extremely short.
*   **Exception:** If your app supports iOS 15 or below, this specific lock is unavailable.

    *   You want the compiler to prevent deadlocks (reentrancy).
*   **Use `OSAllocatedUnfairLock` when:**
    *   State is tiny (Int, Bool, small Struct).
    *   Access is synchronous and extremely frequent (1000+ times/sec).
    *   You are in a performance-critical loop.
    *   **Warning:** You must handle deadlocks yourself.

## Answer 61
## Q: 上下文切换成本：比较 Actor 的 await（挂起）与低级互斥锁/锁（阻塞）的运行时开销。在 120Hz 渲染等高频循环中，为什么 Actor 可能会导致“掉帧”？

🧠 Memory Answer (Quick Recall Layer)
**Actor `await`** involves allocating a Task, scheduling it, and potentially switching threads, costing **microseconds**. A **Lock** (if uncontended) costs **nanoseconds**. In a 120Hz loop (8ms budget), thousands of microsecond-pauses will miss the deadline.
**Recall Hook:** "Locks spin; Actors schedule. Scheduling takes time."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** An uncontended `Lock` is just an atomic CPU instruction (CAS). An `Actor` call involves a mailbox check and a potential task suspension, which requires a heap allocation for the Task's continuation and a hand-off to the global concurrent executor.
*   **Example Anchor:** In a 120Hz rendering engine (8.3ms per frame), calling an `Actor` to fetch a simple configuration value might take 5-10µs. If called hundreds of times in the layout pass, the overhead consumes the entire frame budget.
*   **Pitfall:** Using `await` inside a high-frequency drawing loop or a gesture recognizer update. This forces the thread to yield, and the OS might not reschedule it until after the next V-Sync, causing a "hitch."
*   **Fix:** Read the required state into a local synchronous cache before starting the render loop, or use a thread-safe primitive like `OSAllocatedUnfairLock` for "leaf" state.
*   **Boundary:** This performance gap is irrelevant for most UI logic (button taps, networking), where the safety and ergonomics of Actors outweigh the overhead.

---

🧩 Structured Summary
**Template: T2 Compare Table (Overhead)**

| Aspect | Unfair Lock | Actor await |
| :--- | :--- | :--- |
| **Typical Use Case** | High-frequency counters / Hot loops | Business logic / Async services |
| **Performance** | ~30 ns (CAS) | ~500 - 5000 ns (Task hop) |
| **Mechanism** | Atomic CPU Instruction | Runtime Scheduler / Continuation |
| **Thread Impact** | Blocks (if held) | Yields (Suspending) |
| **Common Pitfall** | Holding too long (Starvation) | Using in 120Hz loops (Frame drops) |

**Exception:** In a highly contended scenario (many threads fighting for one lock), a Lock's performance can degrade significantly as threads park and wake via the kernel, closing the gap with Actors.


## Answer 62
## Q: 重入处理：Actor 是可重入的。解释一种“Actor 重入”导致逻辑竞态条件（状态滑移）的情况。如何在不阻塞线程的情况下防止这种情况？

🧠 Memory Answer (Quick Recall Layer)
**State Slip** happens when an actor suspends (`await`), allowing another task to modify the state before the first task resumes. To prevent this, **re-validate assumptions** after every await, or assume the state is stale.
**Recall Hook:** "Every `await` is a potential plot twist."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** When an Actor hits an `await`, it releases its lock to allow forward progress. Other tasks can enter the Actor and change its properties during this suspension.
*   **Example Anchor:**
    ```swift
    actor Cache {
        var image: UIImage?
        func load() async -> UIImage {
            if let image = image { return image } // Step 1: Check
            let newImage = await fetch() // Step 2: Suspend (Another task enters 'load' here!)
            image = newImage // Step 3: Write (Overwrites if another task finished first)
            return newImage
        }
    }
    ```
*   **Pitfall:** Assuming that a condition checked *before* an `await` (e.g., `balance > 0`) is still true *after* the `await`. This leads to "logical races" like double-spending or redundant network requests.
*   **Fix:** Use **Deduplication**. Instead of storing the result, store an ongoing `Task<UIImage, Error>` inside the actor. Subsequent callers await the *same* task, ensuring the work is only done once.
*   **Boundary:** Reentrancy is a feature designed to prevent deadlocks (A waits for B, B waits for A). You cannot turn it off; you must design your logic to be "reentrancy-aware."

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (State Slip)**

*   **Symptom:** Redundant API calls, overwriting newer data with older data, or inconsistent internal state.
*   **Cause:** Actor reentrancy allows concurrent state modification at suspension points (`await`).
*   **Fix:**
    1.  **Re-check:** Verify conditions again immediately after the `await`.
    2.  **Deduplication:** Store the `Task` object to coalesce multiple requests.
    3.  **Local Snapshots:** Use local variables to hold state values before the await if you need a consistent view.
*   **Prevention:** Group critical mutations into synchronous blocks where no `await` occurs.
*   **Exception:** If the actor represents a stateless service (like a pure API wrapper), reentrancy issues are non-existent.


## Answer 63
## Q: 协作线程池：Swift 并发的“协作线程池”与 GCD 的“并发队列”有何不同？为什么 GCD 会出现“线程爆炸”而 Swift 并发不会？

🧠 Memory Answer (Quick Recall Layer)
**GCD** creates new threads whenever existing ones are blocked, theoretically unbounded (**Thread Explosion**). **Swift Concurrency** maintains a fixed pool (~Core count) and **suspends** tasks instead of blocking threads, guaranteeing efficient CPU usage.
**Recall Hook:** "GCD adds more lanes (Threads) to traffic; Swift removes the cars (Tasks) from the road."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** GCD's concurrency model is based on thread creation. If a thread is blocked (e.g., by a semaphore), GCD spawns a new thread to maintain throughput. Swift Concurrency uses a **Cooperative Thread Pool** where tasks yield control at suspension points (`await`).
*   **Example Anchor:** If you trigger 100 network requests in GCD using a semaphore to wait for each, you might end up with 100 active threads, causing massive memory overhead (1MB per thread stack) and context switch thrashing. In Swift, those 100 `await` calls simply park 100 small Task objects on the heap while keeping only ~6-8 threads active.
*   **Pitfall:** Calling blocking synchronous APIs (like `NSLock.lock()` or `Thread.sleep()`) inside a Swift `Task`. This "steals" a thread from the fixed cooperative pool, potentially starving other tasks.
*   **Fix:** Always use asynchronous alternatives (like `Task.sleep()` or `Actor` isolation) to ensure the thread is freed during waiting periods.
*   **Boundary:** Swift Concurrency still uses threads under the hood, but it manages them via a custom runtime executor rather than the OS-level thread-per-task approach used by legacy GCD patterns.

---

🧩 Structured Summary
**Template: T2 Compare Table (Threading Models)**

| Aspect | GCD (Grand Central Dispatch) | Swift Concurrency |
| :--- | :--- | :--- |
| **Typical Use Case** | Legacy async/await bridging | Modern Swift 6 apps |
| **Thread Count** | Dynamic / Unbounded | Fixed (≈ CPU Cores) |
| **Blocking** | Blocks the Thread | **Suspends** the Task |
| **Overhead** | High (Stack per thread) | Low (Task object on heap) |
| **Common Pitfall** | Thread Explosion (ANR) | Starving the pool with sync blocking |

**Exception:** GCD's serial queues are still useful for simple serialization and are often used by the Swift runtime itself to implement Actors.


## Answer 64
## Q: 自定义执行器：什么时候需要实现自定义的 TaskExecutor？举一个真实世界的例子（例如，将数据库操作隔离到特定线程）。

🧠 Memory Answer (Quick Recall Layer)
Use **Custom Executors** (Swift 5.9+) when you need strict control over *which* thread/queue runs your Actor. This is critical for legacy C++ libs or **SQLite/Realm** which require thread-affinity (must always run on the same specific thread).
**Recall Hook:** "Actors usually float; Executors tie them to the ground."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** By adopting the `Actor` or `GlobalActor` protocol and implementing the `unownedExecutor` property, you can specify a `SerialExecutor` (often wrapping a `DispatchQueue`) to handle the Actor's work.
*   **Example Anchor:** `SQLite` and certain `CoreData` configurations are "thread-confined." If you open a connection on Thread A and try to query on Thread B, it crashes. A Custom Executor ensures the Actor always hops back to the *exact same* serial queue/thread for every method call.
*   **Pitfall:** Overusing custom executors for "performance." Moving work away from the cooperative thread pool can lead to inefficient CPU usage and defeats the runtime's ability to optimize task scheduling.
*   **Fix:** Only use custom executors for **thread-affinity requirements** or specialized low-latency subsystems like Audio Engines.
*   **Boundary:** Custom Executors are an advanced feature (Swift 5.9+). Improper implementation of the `SerialExecutor` protocol (e.g., non-serial execution) can break the Actor's safety guarantees and cause data races.

---

🧩 Structured Summary
**Template: T3 Concept Card (Custom Executors)**

*   **Definition:** A customization point to swap the default Cooperative Pool for a specific run loop or queue.
*   **Why it exists:** To support legacy libraries that require "Thread Locality" and for specialized scheduling needs.
*   **Key properties:**
    1.  **Thread Affinity:** Guarantees work always happens on a specific thread.
    2.  **Resource Isolation:** Prevents specific work from saturating the global pool.
    3.  **Protocol-based:** Implemented via `SerialExecutor` / `unownedExecutor`.
*   **Common Misconception:** Thinking it's for general performance. It's actually for **correctness** when dealing with thread-sensitive APIs.
*   **Exception:** For most business logic, the default global executor is faster and more efficient.
*   **Pitfall:** Implementing a "concurrent" executor for an Actor. **Fix:** Ensure the executor strictly serializes work.


## Answer 65
## Q: 优先级反转：当高优先级任务等待由低优先级任务持有的 Actor 时，Swift 运行时如何处理“优先级反转”？

🧠 Memory Answer (Quick Recall Layer)
Swift Runtime handles **Priority Inversion** via **Priority Escalation** (Inheritance). If a High-Priority task awaits a Low-Priority Actor, the runtime temporarily **boosts** the Actor's priority to High so it finishes faster and unblocks the waiter.
**Recall Hook:** "If the boss is waiting for you, you become the boss (temporarily)."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The runtime manages a dependency graph between Tasks and Actors. When a `userInteractive` task awaits an Actor that is currently busy with a `background` task, the runtime identifies the blockage and escalates the entire Actor's executor priority.
*   **Example Anchor:** Imagine a `DatabaseActor` doing a heavy `.background` backup. If the user suddenly taps a button requiring a `.userInteractive` fetch from that same Actor, the runtime boosts the backup task to `.userInteractive` to clear the mailbox as fast as possible.
*   **Pitfall:** Priority escalation only works within the **Swift Concurrency** system. If you use a `DispatchSemaphore` or `NSLock` inside a Task to wait for another thread, the runtime cannot see this dependency.
*   **Fix:** Never use blocking primitives inside Tasks. Use `await` and `Actor` isolation so the runtime can manage priorities correctly.
*   **Boundary:** Escalation is temporary. Once the high-priority "waiter" is satisfied and the Actor's mailbox has no more high-priority items, the priority drops back to the original level.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Inversion Handling)**

1.  **Conflict:** A High-priority task attempts to access an Actor busy with a Low-priority task.
2.  **Detection:** The Swift Concurrency scheduler identifies the dependency at the `await` point.
3.  **Escalation:** The runtime "boosts" the priority of the task currently running inside the Actor.
4.  **Execution:** The Actor finishes its current work at the elevated priority level.
5.  **Unblock:** The High-priority task is now allowed to enter the Actor.
6.  **Restoration:** The Actor's executor returns to its base priority once high-priority work is done.
7.  **Failure mode:** Use of `os_unfair_lock` or `DispatchSemaphore` breaks this mechanism. **Fix:** Use Actors only.


## Answer 66
## Q: 标识符：解释 SwiftUI 中显式标识符（id(...)）和结构标识符的区别。改变视图层级（如使用 if-else 对比 opacity）如何影响标识符和状态持久化？

🧠 Memory Answer (Quick Recall Layer)
**Structural Identity** relies on the view's position in the hierarchy tree (type info). **Explicit Identity** uses `.id(...)` to bind a view to data. Changing the structure (if/else) destroys the identity and state; changing modifiers (opacity) preserves it.
**Recall Hook:** "If/Else kills the view; Opacity hides the view."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** SwiftUI builds a static type-tree of your view. **Structural Identity** is derived from the path to a view in that tree (e.g., `VStack -> If -> Text`). If the branch changes, SwiftUI considers it a different view. **Explicit Identity** overrides this using a stable identifier.
*   **Example Anchor:**
    ```swift
    // Structural change:
    if isLoggedIn { ProfileView() } else { LoginView() } 
    // Toggling 'isLoggedIn' kills ProfileView and its @State.
    
    // Identity preservation:
    ProfileView().opacity(isLoggedIn ? 1 : 0)
    // ProfileView remains alive in the background, keeping its scroll position and state.
    ```
*   **Pitfall:** Using `if show { MyView() }` for a view that holds important user input (like a text field). When `show` toggles off and on, all user input is lost.
*   **Fix:** Use `.opacity()` or `.offset()` to hide the view if you need to persist its state, or save the state to a parent/ViewModel.
*   **Boundary:** While `.opacity()` preserves state, it consumes memory and CPU for layout. For lists with thousands of items, **Explicit Identity** (`id(\.uid)`) is mandatory for efficient diffing and performance.

---

🧩 Structured Summary
**Template: T2 Compare Table (Identity Types)**

| Aspect | Structural Identity (If/Switch) | Modifier (Opacity/Hidden) |
| :--- | :--- | :--- |
| **Typical Use Case** | Completely different UI states | Toggling visibility of same view |
| **Mechanism** | Tree branch change (Type-level) | Property change (Attribute-level) |
| **Lifecycle** | `init` / `deinit` runs | Remains alive in background |
| **State Persistence** | **Resets** to default | **Persists** |
| **Common Pitfall** | Accidental state loss on toggle | Memory leak (keeping unused views) |

**Exception:** Some modifiers like `.transition()` only trigger when structural identity changes, making `if-else` necessary for specific animations.


## Answer 67
## Q: 依赖图：SwiftUI 的属性图（Attribute Graph）如何检测变化？为什么在 body 属性中直接进行大量计算是不好的做法？

🧠 Memory Answer (Quick Recall Layer)
SwiftUI uses an **Attribute Graph (AG)** to track dependencies. `body` is a computed property called *frequently* to diff the view description. Heavy work in `body` slows down the main thread and can cause dropped frames during scrolling or animation.
**Recall Hook:** "Body is for layout description, NOT for data crunching."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** The Attribute Graph is a directed acyclic graph that links your state (e.g., `@State`, `@ObservedObject`) to the view properties. When a state variable changes, the AG invalidates the "dirty" nodes and re-evaluates the `body` of affected views.
*   **Example Anchor:** In a `UserListView`, if you perform a `bigArray.filter { ... }.sorted()` directly inside the `body`, this heavy O(n log n) operation runs every time the user scrolls or a timer fires nearby, causing "micro-stutters."
*   **Pitfall:** Initializing objects (like `let formatter = DateFormatter()`) inside `body`. This not only wastes CPU but also creates thousands of short-lived objects that trigger frequent Garbage Collection (ARC) pressure.
*   **Fix:** Pre-compute data in the **ViewModel** or use `.task` / `.onAppear` to perform calculations once and store them in a `@State` variable.
*   **Boundary:** Simple logic (like `text.isEmpty ? colorA : colorB`) is perfectly fine and optimized by the compiler. The AG is designed to be fast for lightweight "view descriptions."

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (Heavy Body)**

*   **Symptom:** Stuttering animations, high CPU usage on static screens, and "hanging" during navigation.
*   **Cause:** Expensive operations (Filtering large arrays, Image processing, Date formatting) inside the `body` property.
*   **Fix:** Move heavy logic to a dedicated `ObservableObject` (ViewModel) and observe the pre-calculated result.
*   **Prevention:** Use Instruments (SwiftUI template) to profile "Body Execution" time. Keep it under 1ms.
*   **Exception:** For extremely small datasets (e.g., filtering 5 strings), the overhead of a separate ViewModel might exceed the cost of an inline filter.

    1.  **Computed Prop in VM:** `var sortedList: [Item]` in ViewModel.
    2.  **Memoization:** `let sorted = useMemo(list)`.
    3.  **Task:** Perform work in `.task` modifier and update state.

## Answer 68
## Q: 状态管理演进：在 Swift 6 中，为什么 @StateObject 被视为过时？新的 Observation 框架（@Observable 宏）如何通过减少不必要的视图更新来提高性能？

🧠 Memory Answer (Quick Recall Layer)
**`@StateObject`** (Combine) invalidates the view whenever *any* `@Published` property changes. **`@Observable`** (Swift 6) tracks access at the *property level*, so the View updates ONLY if the specific property it reads changes.
**Recall Hook:** "Observable is a sniper (precise); StateObject is a shotgun (hits everything)."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `ObservableObject` relies on a single `objectWillChange` publisher. Any change to any `@Published` property triggers a full view invalidation. The new **Observation framework** uses the `@Observable` macro to instrument properties. When a View's `body` is executed, the system records exactly which properties were accessed (the "Access List").
*   **Example Anchor:** In a `ProfileViewModel` with `name` and `lastLoginDate`, if a View only displays the `name`, changing the `lastLoginDate` (e.g., via a background timer) will NOT trigger a redraw of that View in Swift 6. In Swift 5, it would redraw the entire View.
*   **Pitfall:** Forgetting that `@Observable` properties are only tracked if they are accessed inside the `body` property. If you read a property inside a helper function that is NOT called by `body`, changes won't trigger updates.
*   **Fix:** Ensure the View actually "observes" the data by reading it during the render pass.
*   **Boundary:** `@Observable` requires **iOS 17+**. If you need to support iOS 16 or below, you must stick with the legacy `ObservableObject` and `@StateObject` pattern.

---

🧩 Structured Summary
**Template: T2 Compare Table (ObservableObject vs @Observable)**

| Aspect | ObservableObject (Classic) | @Observable (Modern) |
| :--- | :--- | :--- |
| **Typical Use Case** | Apps supporting iOS 16 or older | **Modern Swift 6 / iOS 17+ apps** |
| **Tracking Granularity** | Object-level (Any change = Redraw) | **Field-level** (Only read change = Redraw) |
| **Syntax** | `@Published` + `ObservableObject` | `@Observable` macro + standard properties |
| **Injection** | `@EnvironmentObject` | `@Environment(Type.self)` |
| **Common Pitfall** | Performance bottlenecks in large VMs | Using with older OS versions (Unsupported) |

**Exception:** Some complex Combine-based pipelines (e.g., debouncing search text) still benefit from `ObservableObject` because they integrate natively with Combine operators.


## Answer 69
## Q: 布局协议：如何使用 Layout 协议实现自定义的流式布局或瀑布流布局？它与使用 GeometryReader 有何不同？

🧠 Memory Answer (Quick Recall Layer)
The **`Layout` Protocol** (iOS 16+) allows defining custom container logic (size negotiation + placement) efficiently during the layout pass. **`GeometryReader`** reads size *after* layout, often causing cycles or poor performance.
**Recall Hook:** "Layout Protocol defines the rules; GeometryReader just measures the result."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** You implement `sizeThatFits` to negotiate size with the parent and `placeSubviews` to position children. It uses **View Proxies** to communicate dimensions without triggering full view re-renders.
*   **Example Anchor:** To build a **FlowLayout** (like tags), `sizeThatFits` calculates how many rows are needed given a specific width. `placeSubviews` then iterates through proxies and assigns `(x, y)` coordinates. This is all done synchronously during the standard SwiftUI layout pass.
*   **Pitfall:** Attempting to perform heavy calculations or state updates inside `placeSubviews`. This method is called extremely frequently.
*   **Fix:** Use the `makeCache` method in the `Layout` protocol to store layout calculations (like item positions) and only re-calculate if the inputs change.
*   **Boundary:** `Layout` protocol is **iOS 16+ only**. For older versions, you are forced to use `GeometryReader` or `PreferenceKeys`, which are significantly harder to optimize for performance.

---

🧩 Structured Summary
**Template: T3 Concept Card (Layout Protocol)**

*   **Definition:** A formal protocol for creating custom container views that manage child placement.
*   **Why it exists:** To replace the "GeometryReader/Preference" hack-cycle with a deterministic, performant layout engine.
*   **Key properties:**
    1.  **sizeThatFits:** Negotiates dimensions with the parent.
    2.  **placeSubviews:** Assigns exact coordinates to children.
    3.  **Caching:** Built-in `makeCache` for performance optimization.
*   **Common Misconception:** Thinking it's for drawing. It's only for **positioning** and **sizing** views.
*   **Exception:** For simple one-off size checks (like matching a button's width to its label), `GeometryReader` is still easier than a full `Layout` implementation.
*   **Pitfall:** Creating layout loops by modifying state during placement. **Fix:** Keep layout logic pure and calculation-based.


## Answer 70
## Q: GeometryReader 的坑：为什么 GeometryReader 常被称为“布局破坏者”？在列表单元格中使用 it 对性能有什么影响？

🧠 Memory Answer (Quick Recall Layer)
**GeometryReader** is greedy: it tries to expand to fill all available space, ignoring the intrinsic size of its children. This often breaks centering or auto-sizing logic.
**Recall Hook:** "GeometryReader is a gas; it expands to fill the whole container."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Unlike standard SwiftUI views that fit their content, `GeometryReader` behaves like a container that demands all space from its parent. This "greedy" behavior often destroys the expected behavior of `VStack` or `HStack` centering.
*   **Example Anchor:** If you put a small `Circle()` inside a `GeometryReader`, the reader will push the circle to the top-left corner and expand itself to fill the entire screen, breaking any `Spacer()` logic around it.
*   **Pitfall:** Using `GeometryReader` inside a `List` or `ScrollView` to dynamically calculate cell height. This often leads to **infinite layout loops** where the cell changes size, which triggers the reader, which recalculates size, causing the list to jitter or the CPU to hit 100%.
*   **Fix:** Use the **Background Preference** pattern: Place the `GeometryReader` inside a `.background()` modifier of the view you want to measure. This allows the view to keep its natural size while the "invisible" reader spies on its dimensions.
*   **Boundary:** `GeometryReader` is often the only way to read a view's `frame(in: .global)` for complex parallax effects or custom coordinate space mappings.

---

🧩 Structured Summary
**Template: T5 Pitfall Playbook (GeometryReader)**

*   **Symptom:** Views unexpectedly expanding to full screen; Layout loop warnings in console; High CPU usage on scroll.
*   **Cause:** Greedy expansion behavior conflicting with flexible parent constraints (like `ScrollView` or `List`).
*   **Fix:** Use `.background(GeometryReader { ... })` to measure size without affecting the actual layout tree.
*   **Prevention:**
    1.  **Avoid:** Don't use it as a top-level layout container.
    2.  **Anchor:** Use `.coordinateSpace(name:)` to measure relative to a specific parent.
    3.  **Alternative:** Use the `Layout` protocol (iOS 16+) for custom positioning.
*   **Exception:** When you explicitly *want* a view to fill its parent and need to know the dimensions (e.g., a custom drawing/canvas).


## Answer 71
## Q: 动画性能：解释 withAnimation 和 .animation(_:value:) 的区别。如何使用 Instruments 调试复杂 SwiftUI 动画中的“卡顿”（掉帧）？

🧠 Memory Answer (Quick Recall Layer)
**`withAnimation`** is imperative (explicitly wraps the state change), while **`.animation(_:value:)`** is declarative (binds animation to a specific property change). Use **Instruments (SwiftUI / Hangs)** to detect "Hitches" where the UI thread misses the 16ms/8ms window.
**Recall Hook:** "WithAnimation wraps the *cause*; .animation observes the *effect*."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** `withAnimation` triggers an animation for all view changes resulting from a specific code block. `.animation(_:value:)` is a view modifier that watches a specific property and animates only when that value changes, offering finer control.
*   **Example Anchor:** Use `withAnimation { isLoggedIn.toggle() }` to animate a whole-screen transition. Use `.animation(.spring(), value: scrollOffset)` to smoothly move a header while scrolling without affecting other UI elements.
*   **Pitfall:** Using the deprecated `.animation(.default)` without the `value:` parameter. This causes **unintended animations**—if any state in the view changes (even unrelated ones), every animatable property in that view will animate simultaneously, killing performance.
*   **Fix:** Always use `.animation(_:value:)` to scope animations to specific state changes.
*   **Boundary:** `withAnimation` does not work for properties managed by the system outside your direct control (e.g., `ScrollView` offsets), whereas `.animation` can observe those changes via bindings.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Animation Strategy)**

*   **Use `.animation(_:value:)` when:**
    *   You want a specific view to animate in response to a specific local property change.
    *   You need to avoid "animation leaks" to other views in the hierarchy.
*   **Use `withAnimation` when:**
    *   A single state change affects multiple distant views (e.g., a Global Theme change).
    *   You are performing programmatic navigation transitions.
*   **Debugging Process (Instruments):**
    1.  **SwiftUI Template:** Record and look for the **Hitches** track.
    2.  **Commit Delay:** Identify if the "Body" execution is taking too long (> 1ms).
    3.  **Render Loop:** Check for over-invalidated views that redraw every frame.
*   **Rule of thumb:** "Prefer `.animation(_:value:)` for 90% of UI polish."
*   **Exception:** Animations involving `NavigationStack` transitions often require `withAnimation` to be recognized by the system transition engine.


## Answer 72
## Q: 绘图组：什么时候应该使用 .drawingGroup()（Metal 离屏渲染）？为什么不默认对所有视图开启？

🧠 Memory Answer (Quick Recall Layer)
**`.drawingGroup()`** flattens a complex view hierarchy into a single **Metal texture** rendered on the GPU. Use it for views with thousands of shapes/shadows. It’s not default because it has high **Memory Overhead** and breaks some standard UI interactions.
**Recall Hook:** "DrawingGroup is a snapshot for the GPU. Faster to draw, heavier to store."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Instead of rendering each individual view element (circles, paths, gradients) onto the screen buffer every frame, SwiftUI renders them once into an offscreen Metal texture. On subsequent frames, it only re-renders this single texture, significantly reducing the "draw call" count.
*   **Example Anchor:** In a generative art app displaying 5,000 moving particles with shadows, the CPU would be overwhelmed by 5,000 individual drawing commands per frame. Applying `.drawingGroup()` allows the GPU to process the movement of a single flattened texture, maintaining 60/120 FPS.
*   **Pitfall:** Applying `.drawingGroup()` to views containing interactive native components like `TextField`, `VideoPlayer`, or `Map`. Because the view is flattened into a bitmap, the native OS-level integration for these components can break or lose interactive fidelity.
*   **Fix:** Only wrap the "heavy" graphical parts of your UI in the drawing group, keeping interactive controls outside the flattened hierarchy.
*   **Boundary:** Drawing groups only help when the performance bottleneck is **Compositing** (blending too many layers). If the bottleneck is **Layout** (calculating positions), `.drawingGroup()` will not improve performance and might actually slow it down due to the initial flattening cost.

---

🧩 Structured Summary
**Template: T3 Concept Card (drawingGroup)**

*   **Definition:** A view modifier that collapses a view subtree into a single Metal-backed offscreen buffer.
*   **Why it exists:** To offload massive rendering tasks (vector graphics, shadows) from the CPU to the GPU.
*   **Key properties:**
    1.  **Metal-backed:** Uses the high-performance Metal framework.
    2.  **Flattening:** Combines multiple layers into one texture.
    3.  **Rasterization:** Effectively turns a vector-based SwiftUI tree into a bitmap.
*   **Common Misconception:** Thinking it speeds up all slow views. It only speeds up **complex drawing**.
*   **Exception:** On high-refresh-rate displays (ProMotion), the memory overhead for the offscreen buffer is doubled, which can lead to memory pressure in resource-constrained apps.
*   **Pitfall:** Using it on text-heavy views. **Fix:** Be aware that text rendering might lose sharpness due to rasterization.


## Answer 73
## Q: 环境开销：在根级别向 .environment() 注入大型对象是否有性能成本？它如何影响那些不读取该数据的下游视图？

🧠 Memory Answer (Quick Recall Layer)
Injecting a large object into **`.environment()`** has **near-zero cost** for downstream views that don't read it. SwiftUI uses a dependency-tracking graph (Attribute Graph), so only views using `@Environment` will redraw when the object changes.
**Recall Hook:** "Environment is a library; you only pay (in CPU) if you check out a book."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** SwiftUI's **Attribute Graph** treats the environment as a collection of nodes. When you inject an object, it creates a new node in the graph. Views downstream only "subscribe" to this node if they use the `@Environment` property wrapper.
*   **Example Anchor:** If you inject a `GlobalSettings` object at the `App` root, and only the `SettingsView` (three levels deep) reads it, a change to the settings will trigger a re-render of `SettingsView`. Intermediate containers like `MainTabView` and `ContentView` will be **skipped** entirely during the invalidation pass.
*   **Pitfall:** Using the legacy `@EnvironmentObject` with an `ObservableObject` that contains unrelated properties. If *any* `@Published` property in the object changes, **all** views observing that object will redraw, even if they don't use the specific changed property.
*   **Fix:** Use the Swift 6 `@Observable` macro for environment objects. It provides **field-level tracking**, ensuring views only redraw if the specific property they access changes.
*   **Boundary:** Injected environment values are "per-hierarchy." If you present a sheet or a new window, the environment does not automatically propagate unless you explicitly pass it to the new presentation context.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Environment Usage)**

*   **Is it "Global" or "Subsystem" state?**
    *   Theme, User Profile, DB Handle -> ✅ Use Environment.
    *   One-off button state -> ❌ Use `@State` / `@Binding`.
*   **Performance Considerations:**
    *   Redraw cost is proportional to the number of **observers**, not the size of the object.
    *   Environment lookups are O(1) in complexity.
*   **Rule of thumb:** "Inject at the root of the subtree that needs the data; keep properties granular."
*   **Pitfall:** Over-using Environment for data that should be passed as simple parameters, making views harder to preview in isolation. **Fix:** Use default values for environment keys to support previews.
*   **Exception:** If you update an environment value inside a `body` property (creating a feedback loop), you will trigger a runtime crash or infinite refresh.


## Answer 74

## Q: 导航栈：在模块化应用中，如何使用 NavigationStack 和 NavigationPath 处理深度链接 and 编程式导航？
NavigationStack: How do you handle deep linking and programmatic navigation in a modularized app using NavigationStack and NavigationPath?

🧠 Memory Answer (Quick Recall Layer)
Use **`NavigationStack(path:)`** bound to a `NavigationPath` (type-erased) or an `[AppRoute]` array (typed). To drive navigation from a central **Router**, append Hashable enums to the path, which are resolved by `.navigationDestination` modifiers.
**Recall Hook:** "State-driven navigation: Modify the array to move the UI."

---

📘 Core Explanation (Understanding Layer)
*   **Typed vs Type-Erased:** Use a **Typed Array** (e.g., `[Route]`) if all your destinations belong to a single enum. Use **`NavigationPath`** if you need to push heterogeneous data types or don't want to expose internal route enums across module boundaries.
*   **Deep Linking:** Centralize your deep link logic in a `URLHandler`. Parse incoming URLs into `AppRoute` enums and simply replace or append to the Router's `path`.
*   **Multi-stack Coordination:** In a TabView, each tab should have its own **NavigationStack** and **Router**. This ensures that switching tabs doesn't lose the navigation state of the previous tab.
*   **Example Anchor:** For a deep link `myapp://profile/settings`, the Router clears the current path and sets `path = [.profile, .settings]`. SwiftUI automatically animates the transition through both screens.
*   **Pitfall:** **Navigation Loops.** Pushing Screen A onto the path when Screen A is already the root or already in the stack can cause weird UI behavior.
*   **Fix:** Use logic in your Router to check if a route already exists before appending, or use a "Reset and Push" strategy for deep links.
*   **Boundary:** `NavigationStack` does not support "pushing" a new stack on top of an existing one. If you need a modal stack, use `.sheet` or `.fullScreenCover` which can then contain their own `NavigationStack`.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Modular Navigation)**

1.  **Routing Contract:** Define a `enum Route: Hashable` in the module's Interface.
2.  **State Management:** Create a `class Router: ObservableObject` to hold the navigation state.
3.  **Hierarchy:** Wrap each Tab or Root view in a `NavigationStack(path: $router.path)`.
4.  **Destination Mapping:** Use `.navigationDestination(for: Route.self)` to map enums to specific views.
5.  **Deep Link Integration:** Implement `onOpenURL` to parse strings into `Route` sequences and update the Router.
6.  **Persistence:** (Optional) Serialize the `NavigationPath` (using `Codable`) to restore the user's position after an app restart.
7.  **Failure mode:** Navigation fails because `.navigationDestination` is placed too deep in the view tree. **Fix:** Place it at the root of the stack or on the `NavigationStack` itself.

*   **Rule of thumb:** "One stack per tab; one router per stack; one enum per module."
*   **Exception:** For complex iPad apps with multi-column layouts, use `NavigationSplitView` instead of `NavigationStack`.


## Answer 75

## Q: UIKit 互操作：在使用 UIViewControllerRepresentable 将复杂的 UIViewController（如相机或地图）嵌入 SwiftUI 视图时，如何处理生命周期不匹配的问题？
UIKit Interop: How do you handle the lifecycle mismatch when embedding a complex UIViewController (e.g., Camera or Map) inside a SwiftUI view using UIViewControllerRepresentable?

🧠 Memory Answer (Quick Recall Layer)
Use a **Coordinator** to act as the delegate for the UIKit controller. Manage state synchronization in **`updateUIViewController`** using diffing logic (only update what changed), and ensure proper resource cleanup in **`dismantleUIViewController`**.
**Recall Hook:** "Make once; update often; dismantle at the end."

---

📘 Core Explanation (Understanding Layer)
*   **The Bridge:** The **Coordinator** is the only stable object that outlives the `Representable` struct. It should hold the `@Binding` or `@Environment` references needed to pass data back to SwiftUI.
*   **Lifecycle Sync:** SwiftUI views are ephemeral; they are destroyed and recreated. `makeUIViewController` is called once, but `updateUIViewController` is called whenever *any* dependency (like a `@State` or `@Binding`) changes.
*   **Example Anchor:** In a `CameraView`, `makeUIViewController` starts the `AVCaptureSession`. `updateUIViewController` toggles the flashlight based on a SwiftUI `Binding`. `dismantleUIViewController` stops the session to save battery.
*   **Pitfall:** **Retain Cycles.** A common mistake is capturing the `Representable` struct (which is a Value Type) inside a Coordinator's closure.
*   **Fix:** The Coordinator should only interact with the `uiViewController` and its own internal state. If it needs to update SwiftUI, it should do so via the `@Binding` properties it was given.
*   **Boundary:** SwiftUI modifiers like `.onAppear` and `.onDisappear` on the `Representable` view might not fire at the exact same time as the UIKit `viewWillAppear` or `viewWillDisappear`. Always rely on the UIKit lifecycle methods inside the `UIViewController` for critical setup.

---

🧩 Structured Summary
**Template: T4 Process Checklist (UIKit Lifecycle Bridge)**

1.  **Instantiation:** Create the `UIViewController` in `makeUIViewController`. Set up initial properties.
2.  **Coordination:** Implement `makeCoordinator()` to return a class that handles UIKit delegates (e.g., `CLLocationManagerDelegate`).
3.  **Synchronization:** In `updateUIViewController`, check for state changes: `if vc.prop != newValue { vc.prop = newValue }`. **Avoid redundant updates** to prevent flickering.
4.  **Feedback Loop:** The Coordinator updates SwiftUI state by modifying the `@Binding` properties passed into it.
5.  **Dismantle:** Implement `static func dismantleUIViewController` to stop timers, observers, or hardware sessions (Camera, GPS).
6.  **Cleanup:** Ensure the Coordinator doesn't hold strong references to any ViewModels or external actors that should be released.
7.  **Failure mode:** Performance lag due to `updateUIViewController` being called 60 times/sec during an animation. **Fix:** Use `Equatable` checks to short-circuit the update logic.

*   **Rule of thumb:** "Initialization in `make`; Diffing in `update`; Cleanup in `dismantle`."
*   **Exception:** For `UIScrollView` or `UITableView` integration, consider using `UIViewRepresentable` to have finer control over the inner content offsets.

...
## Answer 76

## Q: 冲突解决：为协作笔记应用设计一个同步引擎。当两个用户在离线状态下编辑同一条笔记时，你如何处理“写入冲突”？
Conflict Resolution: Design a sync engine for a collaborative note-taking app. How would you handle a "Write Conflict" when two users edit the same note offline?

🧠 Memory Answer (Quick Recall Layer)
Use **CRDTs** (Conflict-free Replicated Data Types) for automatic merging or **Operational Transformation (OT)** for text-specific ordering. For causal tracking, use **Vector Clocks** or **Hybrid Logical Clocks (HLC)** to ensure events are merged in the correct order across distributed clients.
**Recall Hook:** "Causality over Wall-Clock; Merge over Overwrite."

---

📘 Core Explanation (Understanding Layer)
*   **The Problem:** System clocks are unreliable. If User A (offline) writes at 10:00:05 and User B (offline) writes at 10:00:03, User A's edit might arrive first but be "older."
*   **Causal Merging:** Use **Vector Clocks** to track which version of a note a user had seen *before* making an edit. If User A's edit is based on version 5 and User B's is based on version 5, they are concurrent. If User B's edit is based on version 6 (which includes A's change), it is sequential.
*   **Delta Sync:** Instead of uploading the whole 1MB note, only send **Deltas** (the specific changes). This reduces bandwidth and minimizes the "window" for conflicts.
*   **Example Anchor:** In a "Collaborative Checklist," if User A checks a box and User B renames the task simultaneously while offline, a CRDT allows both changes to persist: the task is renamed AND checked.
*   **Pitfall:** **Semantic Conflicts.** Automated tools merge data, not meaning. User A deletes a paragraph; User B corrects a typo in that same paragraph.
*   **Fix:** Implement **Conflict Callbacks**. If a merge results in a significant data loss or structural change, notify the user and offer a "History" or "Conflict Resolution" UI to pick a version.
*   **Boundary:** CRDTs are complex to implement from scratch. **Exception:** For most apps, use established libraries like **Yjs** or **Automerge** which handle the heavy math of conflict-free merging.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Sync Engine Design)**

1.  **Versioning:** Every note has a `version_id` or `Vector Clock`.
2.  **Edit Capture:** Capture changes as **Operations** (Insert, Delete, Update) locally.
3.  **Local Persistence:** Store operations in a local "Outbox" (SQLite).
4.  **Sync Trigger:** When online, send operations (Deltas) to the server.
5.  **Server Ordering:** Server uses **HLC** to order incoming deltas and broadcast to others.
6.  **Client Merge:** Clients apply incoming deltas using a **CRDT Algorithm** to ensure all clients converge to the same state.
7.  **Conflict Handling:** Detect "Conflicting concurrent edits" and log them in a **Version History** for user recovery.
8.  **Failure mode:** Infinite sync loops. **Fix:** Ensure all operations are **Idempotent** (applying the same change twice has no effect).

*   **Rule of thumb:** "Logical time is more important than real time in distributed systems."
*   **Exception:** For strictly structured data (like a User Profile), a simple "Last-Write-Wins" on a per-field basis is often sufficient and much simpler.


## Answer 77

## Q: 数据库选择：比较高并发聊天应用中 SwiftData、SQLite (GRDB) 和 Realm 的优劣。在特定场景下，资深工程师为什么可能选择原始 SQLite 而非 Core Data/SwiftData？
Database Choice: Compare SwiftData vs. SQLite (GRDB) vs. Realm for a high-concurrency chat app. Why might a Senior Engineer choose raw SQLite over Core Data/SwiftData in specific scenarios?

🧠 Memory Answer (Quick Recall Layer)
**SwiftData** is first-party but lacks the fine-grained performance control of **SQLite (GRDB)**, which is the gold standard for high-concurrency (via WAL mode). **Realm** is fast but its binary size and "Thread Confinement" can be rigid for complex multi-threaded apps.
**Recall Hook:** "SwiftData for UI-first; SQLite for Data-first; Realm for Sync-first."

---

📘 Core Explanation (Understanding Layer)
*   **Control over Concurrency:** In a chat app with 1,000+ incoming messages per minute, **SQLite in WAL (Write-Ahead Logging)** mode is superior. It allows many readers and one writer to work simultaneously without blocking. Core Data/SwiftData often struggle with "Context Locking" during massive background saves.
*   **Schema Migrations:** SQLite (via GRDB) allows you to write **Explicit SQL Migrations**, giving you 100% control over how data is transformed. SwiftData's "Magic" migration can fail or be incredibly slow for multi-million row tables.
*   **FTS (Full-Text Search):** Chat apps need fast searching. SQLite's **FTS5** extension is highly optimized and much faster than performing `NSPredicate` matches against an object graph in memory.
*   **Example Anchor:** In a "Messenger" app, a background sync service writes 500 messages to SQLite. Because of WAL mode, the user can still scroll their message list at 120fps without a single frame drop.
*   **Pitfall:** **The Object-Graph Tax.** Core Data/SwiftData must turn every row into a managed object (faulting), which consumes significant RAM.
*   **Fix:** Use SQLite/GRDB to fetch **Plain Swift Structs**, which are lightweight and have zero overhead.
*   **Boundary:** SwiftData requires **iOS 17+**. If your app supports older versions, SQLite or Core Data are your only production-ready choices.

---

🧩 Structured Summary
**Template: T2 Compare Table (Database Architecture)**

| Aspect | SwiftData / Core Data | Realm | SQLite (GRDB) |
| :--- | :--- | :--- | :--- |
| **Data Model** | Managed Object Graph | Live Object Database | **Relational Rows/Structs** |
| **Concurrency** | Actor/Context Isolation | **Thread-Confinement** | Connection Pooling (WAL) |
| **Migrations** | Mostly Automatic (Fragile) | Block-based (Dynamic) | **SQL Scripts (Deterministic)** |
| **Memory** | High (Object overhead) | Medium (Zero-copy) | **Lowest (Raw Structs)** |
| **Search** | NSPredicate (Slow on large) | Fast indexed search | **FTS5 (Fastest for Chat)** |

*   **Rule of thumb:** "If data is the bottleneck, go SQL; if UI-sync is the bottleneck, go SwiftData."
*   **Exception:** For "Local-only" apps with < 1,000 items, `SwiftData` is almost always the right choice due to its tight integration with SwiftUI.
*   **Pitfall:** "N+1 Query" problem in SQL. **Fix:** Use SQL `JOIN` or eager loading instead of looping over IDs.


## Answer 78

## Q: 图片缓存系统：设计一个自定义图片加载库。如何实现 LRU（最近最少使用）缓存淘汰？如何处理“惊群效应”（针对同一 URL 的重复请求）？
Image Caching System: Design a custom image loading library. How do you implement LRU (Least Recently Used) cache eviction? How do you handle "Thundering Herd" (duplicate requests for the same URL)?

🧠 Memory Answer (Quick Recall Layer)
Use **`NSCache`** for automatic LRU or a **Linked List + Dictionary** for manual control. To fix the **Thundering Herd**, use a **Request Registry** to coalesce duplicate requests into a single `Task`.
**Recall Hook:** "Coalesce requests; cache outcomes."

---

📘 Core Explanation (Understanding Layer)
*   **Coalescing:** Use an `actor` or a thread-safe dictionary to store `Task<UIImage, Error>` objects. If a URL is already being fetched, subsequent callers `await` the existing task.
*   **Memory Management:** Listen for `UIApplication.didReceiveMemoryWarningNotification` to clear the memory cache. `NSCache` does this automatically, but custom implementations must handle it manually to avoid OOM (Out of Memory) crashes.
*   **Pre-fetching:** Implement **`UICollectionViewDataSourcePrefetching`** to start downloads before cells enter the screen. This ensures the cache is "warm" for the user.
*   **Example Anchor:** In a "Social Feed," as the user scrolls, the pre-fetcher triggers downloads for the next 5 rows. When the user actually sees them, the images appear instantly from the LRU memory cache.
*   **Pitfall:** Over-caching high-resolution images. 100 4K images can easily consume 2GB of RAM.
*   **Fix:** **Downsample** images to the exact size of the `UIImageView` before storing them in the memory cache.
*   **Boundary:** `NSCache` is not persistent. Always back it up with a **Disk Cache** (using `FileManager`) for cross-session persistence.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Image Loading Pipeline)**

1.  **Memory Hit:** Check LRU cache. If found, return instantly on Main Thread.
2.  **Request Coalescing:** Check registry for ongoing `Task`. If exists, `await` it.
3.  **Disk Hit:** Check `Caches` directory. If found, decode, **Downsample**, cache in memory, and return.
4.  **Network Fetch:** Start `URLSession` data task.
5.  **Processing:** Decode data -> Downsample -> Store in Disk & Memory -> Clear registry.
6.  **Cleanup:** Automatically evict from memory on **Memory Warning** or when LRU limit is hit.
7.  **Failure mode:** Images showing in the wrong cell after scrolling. **Fix:** Always check the `imageURL` against the cell's current `identity` before setting the image.

*   **Rule of thumb:** "Store original on disk; store downsampled in memory."
*   **Exception:** For "GIFs" or "Videos," use a separate stream-based cache to avoid loading huge files into memory.

Resiliency: How do you implement "Exponential Backoff" and "Jitter" for retrying failed network requests in a clean way?

## Answer 79

## Q: 弹性：如何以优雅的方式实现失败网络请求重试的“指数退避”和“抖动”策略？
Resiliency: How do you implement "Exponential Backoff" and "Jitter" for retrying failed network requests in a clean way?

🧠 Memory Answer (Quick Recall Layer)
**Exponential Backoff** doubles the wait time after each failure (1s, 2s, 4s...) to protect the server. **Jitter** adds randomness (e.g., ±20%) to this delay to prevent a "Thundering Herd" where all clients retry simultaneously.
**Recall Hook:** "Wait longer, wait randomly."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** When a request fails due to a transient error (e.g., `503` or `429`), calculate the next delay using `baseDelay * 2^attempt`. Then apply **Full Jitter** (random delay between 0 and the calculated maximum) to maximize server relief.
*   **Modern Swift:** Use **`ContinuousClock`** in Swift 6 for precision sleeping that isn't affected by system time changes.
*   **Circuit Breaker:** If a request fails repeatedly, the client should "open the circuit" and stop retrying for a few minutes to allow the server to recover.
*   **Example Anchor:** In a "Stock Ticker" app, if the price API is overloaded (`429`), the app waits 1.2s, then 2.5s, then 4.8s, instead of spamming retries every 1s.
*   **Pitfall:** Retrying `401 Unauthorized`. This will never succeed and just wastes battery.
*   **Fix:** Only retry for **Idempotent** methods (GET, HEAD, PUT, DELETE) and specific status codes (5xx, 408, 429).
*   **Boundary:** Always respect the **`Retry-After`** HTTP header if provided by the server; it overrides your local backoff logic.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Elastic Retry)**

1.  **Error Check:** Capture failure. Verify if `status == 429`, `503`, or `timedOut`.
2.  **Header Check:** Does the response have a `Retry-After` header? Use it if available.
3.  **Calculation:** `let maxDelay = base * pow(2, attempt)`.
4.  **Jitter:** `let actualDelay = Double.random(in: 0...maxDelay)`.
5.  **Sleep:** `try await Task.sleep(for: .seconds(actualDelay), clock: .continuous)`.
6.  **Re-try:** Execute the request again.
7.  **Give Up:** After `maxAttempts` (e.g., 5), throw the final error to the user.
8.  **Failure mode:** Infinite loop. **Fix:** Always use a hard cap on attempts and delay (e.g., max 30s).

*   **Rule of thumb:** "Backoff for the server; Jitter for the network; Circuit breaker for the user."
*   **Exception:** For background sync (e.g., `BGTaskScheduler`), the OS handles retries; don't implement aggressive local retries there.

## Answer 80

## Q: 功能模块：如何组织一个拥有 50 多名工程师的项目？解释接口模块（API）和实现模块之间的区别。这如何缩短编译时间？
Feature Modules: How do you structure a project with 50+ engineers? Explain the difference between Interface Modules (API) and Implementation Modules. How does this reduce build time?

🧠 Memory Answer (Quick Recall Layer)
Organize the app into **Feature Modules** using an **Interface/Implementation split**. By having modules depend only on static **Interfaces**, you create a **Binary Boundary** that stops recompilation propagation, drastically reducing build times for large teams.
**Recall Hook:** "Ship the Interface; hide the churn."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** In a monolith, changing one file can trigger a massive re-index/re-build. With an **Interface Module** (containing only Protocols/DTOs), the **Implementation Module** can change its logic 100 times without ever triggering a re-compile of dependent features, because the public "contract" (the Interface) remains stable.
*   **Build Systems:** At a scale of 50+ engineers, standard Xcode projects/SPM can struggle. Many senior teams move to **Bazel** or **Tuist** to enable **Remote Caching** (sharing pre-built binaries across the team) and **Selective Testing**.
*   **Example Anchor:** In a "Payments" feature, the Interface defines `protocol Pay`. Feature A uses `Pay`. When you add a new payment provider to the Implementation, Feature A **does not recompile** because it only knows about the `Pay` protocol.
*   **Pitfall:** **The "God Core" Module.** Putting every shared utility into one `Core` module. If `Core` changes, the *entire* app recompiles.
*   **Fix:** Use **Granular Utility Modules** (e.g., `NetworkUtilities`, `UIComponents`) rather than one giant `Common` folder.
*   **Boundary:** High link-times. Too many small dynamic frameworks can slow down app launch. Use **Static Libraries** for internal modules to keep launch times fast.

---

🧩 Structured Summary
**Template: T3 Concept Card (Interface vs Implementation)**

*   **Definition:** A modular pattern that separates a feature's public contract from its private logic.
*   **Key Value:** **Incremental Build Isolation**. Changes in logic don't leak into the rest of the project.
*   **Architecture Components:**
    1.  **Interface Module:** Protocols, Enums, DTOs (The "What").
    2.  **Implementation Module:** Classes, Private Helpers, Logic (The "How").
    3.  **Mock Module:** Stubbed data for lightning-fast Unit Tests and Previews.
*   **Tooling:** Use **Tuist** or **Bazel** to manage complex module graphs and visualize dependencies.
*   **Pitfall:** Placing logic in the Interface. **Fix:** Keep it strictly for declarations.
*   **Exception:** For tiny, stable features (e.g., `AboutUs`), a single module is simpler.


## Answer 81

## Q: 依赖注入：在多模块应用中，如何在功能模块不了解主应用的情况下向其注入依赖？（依赖倒置）。
Dependency Injection: In a multi-module app, how do you inject dependencies into a Feature Module without that module knowing about the main app? (Dependency Inversion).

🧠 Memory Answer (Quick Recall Layer)
Use **Dependency Inversion**. The Feature Module defines its requirements as **Protocols** (in its Interface module). The Main App (the "Glue") provides the concrete implementation at runtime, injecting it into the feature at the **Composition Root**.
**Recall Hook:** "The Feature defines the contract; the App fulfill it."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** Instead of a Feature importing a "Global Analytics" module, it declares a `protocol FeatureAnalytics`. This keeps the Feature **agnostic** of the actual provider. The Main App then maps its `AppAnalytics` class to that protocol.
*   **Composition Root:** This is the single place (usually in the App target or a high-level Coordinator) where all dependencies are wired together. This prevents "Prop Drilling" where you pass dependencies through intermediate layers that don't need them.
*   **Example Anchor:** In a `SearchFeature`, you define a `SearchDependency` protocol. The Main App's `SceneDelegate` instantiates the `SearchFeature` and injects the actual `AppNetwork` and `AppLogger`.
*   **Pitfall:** Over-using **Singletons** or **Service Locators** inside feature modules. This hides the dependency graph and makes the module impossible to test in isolation.
*   **Fix:** Always prefer **Constructor Injection**. If a module has too many dependencies, group them into a "Context" or "Container" protocol.
*   **Boundary:** For deeply nested SwiftUI views, **`@Environment`** acts as a safe, type-safe Service Locator that avoids passing dependencies through 10 layers of view code.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (DI in Modules)**

*   **Use Dependency Inversion (Protocols) when:**
    *   Crossing a Module Boundary (e.g., Feature A depends on Service B).
    *   You need to mock services for Unit Testing or SwiftUI Previews.
    *   You want to swap implementations based on build flavor (Dev vs. Prod).
*   **Avoid Protocols when:**
    *   The logic is private to the module and will never change (Avoid "Protocol-itis").
*   **Rule of thumb:** "Modules define their own 'Interface' needs; the Composition Root injects them."
*   **Pitfall:** Passing "God Objects" (one struct with 50 dependencies). **Fix:** Use **Interface Segregation** to provide only the subset of methods the module needs.
*   **Exception:** For system-wide services like `NotificationCenter`, direct access is often more pragmatic than injection.


## Answer 82

## Q: 并发测试：如何对 Actor 或 async/await 函数进行单元测试？MainActor.assumeIsolated 在测试中有什么作用？
Concurrency Testing: How do you unit test an actor or an async/await function? How does MainActor.assumeIsolated help in tests?

🧠 Memory Answer (Quick Recall Layer)
Modern testing uses **`async` test methods** and the **`await`** keyword. **`MainActor.assumeIsolated`** allows you to perform synchronous assertions on MainActor-isolated properties without spawning a new task, provided the test itself is running on the Main Thread.
**Recall Hook:** "Await the work; assume the context for assertions."

---

📘 Core Explanation (Understanding Layer)
*   **Async Tests:** Swift Testing (the new standard) and XCTest allow tests to be `async`. When testing an `actor`, every method call must be `await`ed to cross the isolation boundary.
*   **MainActor.assumeIsolated:** If you have a ViewModel on the `@MainActor` and you want to check its state after an async call, `assumeIsolated` lets you read that property synchronously. This prevents the "jitter" of spawning a new `Task` just to check a value in a test.
*   **Confirmations:** In the **Swift Testing** framework, use `confirmation` to verify that an async event or callback actually occurred, replacing the verbose `XCTestExpectation`.
*   **Example Anchor:** 
    ```swift
    @Test func loginFlow() async {
        await confirmation("Login callback") { done in
            viewModel.onLogin = { done() }
            await viewModel.login()
        }
    }
    ```
*   **Pitfall:** Testing unstructured concurrency (`Task { ... }`). The test might finish before the background task completes.
*   **Fix:** Use **Dependency Injection** to inject a "Test Clock" or use `await` on a specific property change (Observation).
*   **Boundary:** `assumeIsolated` will **crash** if called from a non-main thread. Ensure your test class or method is marked `@MainActor`.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Modern Async Testing)**

1.  **Framework:** Use the **Swift Testing** framework (`@Test` attribute).
2.  **Isolation:** Mark the test method `async` and potentially `@MainActor`.
3.  **Action:** `await` the actor method or async function under test.
4.  **Observation:** Use `confirmation` for testing closures or delegates.
5.  **Assertion:** Use `MainActor.assumeIsolated` for synchronous state checks on the MainActor.
6.  **Verification:** Use `#expect` to verify final states.
7.  **Failure mode:** Racing against a background `Task`. **Fix:** Refactor code to use structured concurrency or provide a waitable handle.

*   **Rule of thumb:** "If it's an actor, `await` it. If it's on the MainActor, `assumeIsolated` to check it."
*   **Exception:** For legacy delegate callbacks, you may still need `withCheckedContinuation` to bridge them into the async test flow.
*   **Pitfall:** Over-using `Task.sleep` to fix race conditions in tests. **Fix:** Use deterministic signaling.

## Answer 83

## Q: 快照测试：快照测试（如 Point-Free 的库）的优缺点是什么？如何处理由不同屏幕尺寸或系统版本引起的“不稳定性”？
Snapshot Testing: What are the pros and cons of Snapshot Testing? How do you handle "flakiness" caused by different screen sizes or OS versions?

🧠 Memory Answer (Quick Recall Layer)
**Snapshot Testing** captures a view's visual state and compares it against a reference image. While it catches visual regressions instantly, it is prone to **flakiness** due to sub-pixel rendering and OS differences. Mitigate this with **precision thresholds** and **narrow test scopes**.
**Recall Hook:** "Snapshots for the UI's look; Unit tests for its heart."

---

📘 Core Explanation (Understanding Layer)
*   **Pros:** Instant detection of "Visual Regressions" (broken layout, wrong colors, padding) that unit tests miss. Excellent for verifying **Edge Case States** (e.g., long text, RTL layout, Dark Mode).
*   **Cons:** High maintenance cost. Pixel-level differences between an M2 Mac and an Intel CI runner, or iOS 17.0 vs 17.5, can cause "false failures."
*   **Strategy:** Only snapshot **Reusable Leaf Components** (buttons, cells) or **Critical Landing Pages**. Snapshotting every screen leads to "PR Fatigue" where developers just blindly update images.
*   **Alternative Diffing:** Some tools allow snapshotting the **View Hierarchy (Layer Tree)** instead of pixels. This is much faster and 100% resilient to OS-level rendering changes.
*   **Pitfall:** Committing snapshots generated locally on an M1/M2 while CI runs on Intel.
*   **Fix:** Use a **Remote Snapshot Runner** (CI) or a **Docker container** to ensure the environment (OS version, Chip architecture) is identical for all developers.
*   **Boundary:** Snapshots cannot test **Interactivity** (e.g., what happens after a tap). Use logic-based unit tests for that.

---

🧩 Structured Summary
**Template: T2 Compare Table (Snapshot Strategy)**

| Aspect | Pixel Snapshots | View Hierarchy Snapshots |
| :--- | :--- | :--- |
| **Accuracy** | Catches every pixel shift | Catches layout/structure changes |
| **Stability** | Fragile (OS/Hardware dependent) | **Highly Stable** |
| **Storage** | Large (Binary PNG files) | Tiny (Text/XML files) |
| **Setup** | Requires standard CI runner | Easy to setup in any environment |
| **Best For** | Visual/Design consistency | Structural layout integrity |

*   **Rule of thumb:** "Limit snapshots to reusable components and use a 1-2% tolerance for pixel diffing."
*   **Exception:** For pixel-perfect design systems, a 0% tolerance is required, but you must strictly lock the OS version (e.g., iOS 17.4 exactly).
*   **Pitfall:** Snapshotting dynamic data (dates/random names). **Fix:** Inject a **Mock Data Provider** with static values.

## Answer 84

## Q: UI 测试：如何设计对 UI 变化具有弹性的 UI 测试？（例如，使用无障碍标识符对比文本匹配）。
UI Testing: How do you design UI Tests that are resilient to UI changes? (e.g., using accessibility identifiers vs. text matching).

🧠 Memory Answer (Quick Recall Layer)
Design resilient UI tests by using **Accessibility Identifiers** as unique, stable keys instead of matching by localized text. For large-scale projects, implement the **Robot Pattern** to decouple "What to test" from "How to find it," making tests readable and immune to minor hierarchy shifts.
**Recall Hook:** "Identifiers for stability; Robots for maintainability."

---

📘 Core Explanation (Understanding Layer)
*   **Decoupling:** Relying on `app.buttons["Login"]` fails when the app is localized. `accessibilityIdentifier` is a developer-only tag that stays constant, unlike `accessibilityLabel` which changes with VoiceOver translations.
*   **The Robot Pattern:** Encapsulate XCUI calls in a "Robot" class. If a button moves from a footer to a header, you only update the Robot's internal locator, and all tests using that Robot remain valid.
*   **Example Anchor:** Use a `LoginRobot` that exposes `enter(user:)` and `tapLogin()`. The test reads like a script: `loginRobot.enter(user: "A").tapLogin().assertHomeVisible()`.
*   **Pitfall:** Using deep hierarchy paths (e.g., `.children(matching: .any).element(boundBy: 0)`). One new container view breaks the test.
*   **Fix:** Always use unique Identifiers. If an element is hard to find, add an ID rather than navigating the tree.
*   **Boundary:** UI Tests are slow and prone to network flakiness. **Exception:** Use **Mock Servers** (like `Swifter`) inside the UI test to eliminate network dependency and ensure deterministic results.

---

🧩 Structured Summary
**Template: T1 Decision Checklist (Resilient UI Testing)**

*   **Use Accessibility Identifiers when:**
    *   The app supports multiple languages (Localization).
    *   The UI undergoes frequent design tweaks (Padding, Nesting).
    *   The copy/labels are managed by a CMS or Marketing team.
*   **Use the Robot Pattern when:**
    *   You have more than 10 UI tests or a complex navigation flow.
    *   You want to share interaction logic between different test cases.
*   **Avoid Text Matching when:**
    *   Strings are dynamic (Usernames, Dates).
    *   The element is an icon without a label.
*   **Rule of thumb:** "Identifiers are for the machine; Robots are for the developer; Labels are for the user."
*   **Common pitfall:** Using `accessibilityLabel` for testing. **Fix:** Use `accessibilityIdentifier` to avoid breaking VoiceOver or translation flows.

## Answer 85

## Q: 性能分析：除了“Leaks”，你还使用哪些 Instruments 工具？如何使用“Swift Concurrency”模板来可视化 Actor 争用？
Instruments: Apart from "Leaks", what other Instruments do you use? How do you use the "Swift Concurrency" template to visualize actor contention?

🧠 Memory Answer (Quick Recall Layer)
Beyond "Leaks," use **Time Profiler** for CPU and **Allocations** for heap tracking. The **Swift Concurrency** template visualizes **Actor Contention** via the "Actor" lane; orange segments represent tasks blocked by a busy actor executor.
**Recall Hook:** "Profile time for speed; visualize tasks for concurrency health."

---

📘 Core Explanation (Understanding Layer)
*   **Essential Tools:** **Time Profiler** identifies high-latency functions. **Animation Hitches** tracks frame drops (8.3ms/16ms budget).
*   **Concurrency View:** This instrument displays a timeline of `Task` lifecycles and `Actor` serial executors. Contention is visible when multiple tasks overlap in the timeline but only one is "Running" while others are "Waiting" for the Actor's mailbox.
*   **Example Anchor:** Use **Time Profiler** with "Invert Call Tree" enabled to find a specific JSON parsing method consuming 40% of the CPU. Use the **Concurrency** template to see a `DatabaseActor` being bottlenecked by 10 background tasks.
*   **Pitfall:** Profiling in **Debug mode** or without **Symbolication**. Debug builds are up to 10x slower and missing symbols show memory addresses (0x123...) instead of function names.
*   **Fix:** Always profile the **Release** build. Ensure "Debug Information Format" is set to "DWARF with dSYM" in Build Settings to see readable method names.
*   **Boundary:** Instruments is a "Sampler" (typically 1ms intervals). It may miss extremely short-lived spikes (< 0.5ms) unless you increase the sampling rate.

---

🧩 Structured Summary
**Template: T4 Process Checklist (Visualizing Actor Contention)**

1.  **Preparation:** Build the app in **Release** mode; select "Profile" (Cmd + I).
2.  **Template Selection:** Choose the **Swift Concurrency** instrument.
3.  **Recording:** Reproduce the slow behavior (e.g., heavy scrolling or data sync).
4.  **Isolation View:** Locate the **Swift Actors** section and find the lane for your specific actor.
5.  **Contention Analysis:** Identify "Waiting" (orange) blocks. Click them to see the **Task ID** and the duration of the wait.
6.  **Backtrace Analysis:** Use the "Extended Detail" view to see the stack trace of the waiting task to find the `await` call site.
7.  **Resolution:** Reduce contention by making actor methods synchronous (if possible) or splitting a "God Actor" into smaller, specialized actors.

*   **Rule of thumb:** "If the UI hitches, use Time Profiler; if tasks are slow, use Concurrency."
*   **Exception:** For low-level thread deadlocks not involving Swift Tasks (e.g., `pthread_mutex`), the Concurrency instrument will not show the blockage; use **System Trace** instead.
*   **Pitfall:** Misinterpreting "Suspended" tasks as "Contention". **Fix:** A task is suspended at `await` by design; it only counts as contention if it is **Ready** to run but blocked by another task.

## Answer 86
## Q: MetricKit：如何使用 MetricKit 监控线上用户的崩溃和“悬挂率”（主线程卡死）？

🧠 Memory Answer (Quick Recall Layer)
**MetricKit** is an Apple framework that aggregates on-device performance and crash data. It delivers reports once a day via **`MXMetricPayload`** (energy/performance) and **`MXDiagnosticPayload`** (crashes and hangs), allowing you to monitor real-world user health without third-party SDKs.
**Recall Hook:** "Daily reports for energy; diagnostic payloads for crashes."

---

📘 Core Explanation (Understanding Layer)
*   **Mechanism:** MetricKit collects data silently to preserve battery. Your app receives a callback containing data from the last 24 hours.
*   **Crashes:** `MXCrashDiagnostic` provides stack traces and termination reasons for app crashes that occurred in the previous period.
*   **Hang Rates:** `MXHangDiagnostic` identifies periods where the Main Thread was unresponsive (ANR - Application Not Responding). It provides the duration and the call stack of the hang.
*   **Example Anchor:** Conforming to `MXMetricManagerSubscriber` in your `AppDelegate` and implementing `didReceive(_ payloads: [MXMetricPayload])` to send telemetry to your internal analytics server.
*   **Pitfall:** Expecting real-time alerts. MetricKit is **intentionally delayed** by Apple to batch data. **Fix:** Use Firebase Crashlytics or Sentry if you need immediate crash notifications.
*   **Boundary:** MetricKit only runs on physical devices (iOS 13+) and data delivery depends on Apple's background scheduling; it will not work on simulators.

---

🧩 Structured Summary
**Template: T4 Process Checklist (MetricKit Integration)**

1.  **Import:** Add `import MetricKit` to your entry point or a dedicated monitor class.
2.  **Subscribe:** Call `MXMetricManager.shared.add(self)` during app launch.
3.  **Implement Subscriber:** Conform to `MXMetricManagerSubscriber` protocol.
4.  **Handle Diagnostics:** Implement `didReceive(_ payloads: [MXDiagnosticPayload])` to capture `MXCrashDiagnostic` and `MXHangDiagnostic`.
5.  **Data Processing:** Convert payloads to JSON or a readable format.
6.  **Upload:** Send the aggregated data to your backend for symbolicating and visualization.
7.  **Failure mode:** Forgetting to remove the subscriber on deinit (though usually shared), or assuming all users generate data (requires "Share iPhone Analytics" to be enabled in iOS settings).
