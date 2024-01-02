//
//  Game.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class Game {
    
    var log: GameLog?
    
    private let players: [Player]
    
    private var deck = [Card]()
    
    init(players: [Player]) {
        self.players = players
    }
    
    func start() {
        log?.log("Game is started", status: .start)
        firstSet()
    }
    
    private func firstSet() {
        deck = Card.deck.shuffled()
        players.enumerated().forEach({ index, player in
            player.index = index
            player.stack.append(FirstSet(isLast: index == players.count - 1))
        })
        players[0].inAct()
    }
    
}
