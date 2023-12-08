// The Swift Programming Language
// https://docs.swift.org/swift-book

public class OdessaBridgeSeanse: GameLog {
    
    init() {
        super.init()
        log("Seanse is started", status: .start)
    }
    
    deinit {
        log("Seanse is finished", status: .finish)
    }

    func startGame() {
        log("Game is started", status: .start)
    }
    
}
