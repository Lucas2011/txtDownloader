import Foundation

class Debouncer {
    private let delay: TimeInterval
    private var timer: Timer?

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func debounce(action: @escaping (() -> Void)) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            action()
        }
    }
}

class SearchManager {
    private let debouncer: Debouncer
    private var currentQuery: String = ""

    init(debounceDelay: TimeInterval) {
        self.debouncer = Debouncer(delay: debounceDelay)
    }

    func search(query: String) {
        // Replace this with your actual search logic
        print("Searching for: \(query)")
    }

    func handleSearchInput(query: String) {
        currentQuery = query
        debouncer.debounce {
            self.search(query: self.currentQuery)
        }
    }
}

// Usage:
let searchManager = SearchManager(debounceDelay: 0.5) // Adjust the delay as needed
searchManager.handleSearchInput(query: "Initial search query")
// The search method will be called after the debounce delay (0.5 seconds in this example)