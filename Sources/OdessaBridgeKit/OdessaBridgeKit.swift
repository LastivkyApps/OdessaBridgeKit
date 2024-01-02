// The Swift Programming Language
// https://docs.swift.org/swift-book

public class OdessaBridgeSeanse: GameLog {
    
    private var currentGame: Game?
    
    public override init() {
        super.init()
        log("Seanse is started", status: .start)
    }
    
    deinit {
        log("Seanse is finished", status: .finish)
    }

    public func startSingleGame(pannel: UserPannel, botsCount: Int) {
        let game = GameFactory().onePlayerGame(pannel: pannel, botsCount: botsCount)
        currentGame = game
        game.log = self
        game.start()
    }
    
}
