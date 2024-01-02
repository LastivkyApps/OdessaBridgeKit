//
//  RandomBotPlayer.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class RandomBotPlayer: Player {
    
    var index: Int?
    weak var gamePannel: GamePannel?
    
    var stack = [Move]()
    
    private(set) var cardsInHand = [Card]()
    
    func inAct() {
        guard !stack.isEmpty else {
            return
        }
        let move = stack.removeFirst()
        move.make(for: self)
    }
    
    func pushCards(_ cards: [Card]) {
        cardsInHand += cards
    }
    
}
