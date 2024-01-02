//
//  Game.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class Game {
    
    var log: GameLog?
    
    private var currentMoveIndex = 0
    
    private let players: [Player]
    
    private var deck = [Card]()
    private var field = [Card]()
    
    private var direction = 1
    
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
            player.gamePannel = self
            player.stack.append(FirstSet(isLast: index == players.count - 1))
        })
        callMove()
    }
    
    private func callMove() {
        players[currentMoveIndex].inAct()
        if players.count > 1 {
            callMove()
        }
    }
    
}

extension Game: GamePannel {
    
    func getCards(count: Int = 1, for playerIndex: Int) {
        if deck.count >= count {
            var cards = [Card]()
            (0..<count).forEach({ _ in cards.append(deck.removeFirst()) })
            players[playerIndex].pushCards(cards)
            log?.log("Player\(playerIndex) get cards: \(cards.map({ $0.description }))")
        } else {
            // TODO: change deck and recall
        }
    }
    
    func nextPlayer(playerIndex: Int) {
        currentMoveIndex = (playerIndex + direction) % players.count
    }
    
    func putFirstCard() {
        field.append(deck.removeFirst())
        log?.log("Card \(field[0].description) was putted automatically")
        setPuttedCardsEffect([field[0]])
    }
    
    private func setPuttedCardsEffect(_ cards: [Card]) {
        let lastCard = cards.last!
        switch lastCard {
        case .two(suit: let suit):
            if cards.count % 2 == 1 {
                direction *= -1
            }
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .three(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .four(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .five(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .six(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .seven(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .eight(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .nine(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ten(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .jack(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .queen(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .king(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ace(suit: let suit):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .joker(color: let color):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .calendar:
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ourFather:
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        }
    }
    
}
