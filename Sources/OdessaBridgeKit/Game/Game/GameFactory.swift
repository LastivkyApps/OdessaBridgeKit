//
//  GameFactory.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class GameFactory {
    
    func onePlayerGame(pannel: UserPannel, botsCount: Int) -> Game {
        let player = RealPlayer(pannel: pannel)
        let bots = (0..<botsCount).map({ _ in RandomBotPlayer() })
        let game = Game(players: ([player] + bots).shuffled())
        return game
    }
    
}
