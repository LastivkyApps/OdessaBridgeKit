// The Swift Programming Language
// https://docs.swift.org/swift-book

public class OdessaBridgeSeanse: GameLog {
    
    public override init() {
        super.init()
        log("Seanse is started", status: .start)
    }
    
    deinit {
        log("Seanse is finished", status: .finish)
    }

    public func startGame() {
        log("Game is started", status: .start)
    }
    
}
