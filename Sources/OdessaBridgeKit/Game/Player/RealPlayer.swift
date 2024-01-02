//
//  RealPlayer.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class RealPlayer: Player {
    
    let pannel: UserPannel
    
    var index: Int?
    weak var gamePannel: GamePannel?
    
    var stack = [Move]()
    
    private(set) var cardsInHand = [Card]()
    
    init(pannel: UserPannel) {
        self.pannel = pannel
    }
    
    func inAct() {
        guard !stack.isEmpty else {
            stack.append(PutCard())
            return
        }
        let move = stack.removeFirst()
        move.make(for: self)
        // TODO: pannel logic
    }
    
    func pushCards(_ cards: [Card]) {
        cardsInHand += cards
    }
    
    func getRandomCard() -> Card {
        let card = cardsInHand.randomElement()!
        cardsInHand.removeAll(where: { $0 == card })
        return card
    }
    
    func chooseExchangeCard() -> Card {
        let card = cardsInHand.randomElement()!
        cardsInHand.removeAll(where: { $0 == card })
        return card
    }
    
    func choosePlayerForExchange() -> Int {
        var player = index!
        while player == index {
            player = (0..<gamePannel!.playersCount).randomElement()!
        }
        return player
    }
    
    func chooseSuit() -> CardSuit {
        return [CardSuit.cross, .peak, .chirva, .tambourine].randomElement()!
    }
    
}
