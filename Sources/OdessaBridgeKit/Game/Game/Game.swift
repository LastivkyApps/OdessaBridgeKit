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
    
    init(players: [Player]) {
        self.players = players
    }
    
    func start() {
        log?.log("Game is started", status: .start)
        
    }
    
}
