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
            stack.append(PutCard())
            return
        }
        let move = stack.removeFirst()
        move.make(for: self)
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
    
    func chooseCards() -> [Card]? {
        let suits = gamePannel!.suit
        for suit in suits {
            if let card = cardsInHand.first(where: { $0.suit.contains(suit) }) {
                let puttedCards = cardsInHand.filter({ card.value == $0.value })
                for puttedCard in puttedCards {
                    cardsInHand.removeAll(where: { $0 == puttedCard })
                }
                return puttedCards.sorted(by: { first, _ in first == card })
            }
        }
        let values = gamePannel!.cardValue
        for value in values {
            let puttedCards = cardsInHand.filter({ $0.value == value })
            for puttedCard in puttedCards {
                cardsInHand.removeAll(where: { $0 == puttedCard })
            }
            if !puttedCards.isEmpty {
                return puttedCards
            }
        }
        let puttedQueens = cardsInHand.filter({ $0.value == .queen })
        for puttedCard in puttedQueens {
            cardsInHand.removeAll(where: { $0 == puttedCard })
        }
        if !puttedQueens.isEmpty {
            return puttedQueens
        }
        let puttedJacks = cardsInHand.filter({ $0.value == .jack })
        for puttedCard in puttedJacks {
            cardsInHand.removeAll(where: { $0 == puttedCard })
        }
        if !puttedJacks.isEmpty {
            return puttedJacks
        }
        return nil
    }
    
}
