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
    private var hardcoddedSuite: CardSuit?
    
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
    
    var playersCount: Int {
        return players.count
    }
    
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
        log?.log("Next move is in player\(currentMoveIndex)")
    }
    
    func putFirstCard() {
        field.append(deck.removeFirst())
        log?.log("Card \(field[0].description) was putted automatically")
        setPuttedCardsEffect([field[0]])
    }
    
    func makeExchange(with player: Int, for card: Card, onRelease: @escaping (Card) -> Void) {
        players[player].stack.insert(MandatoryExchange(cardIn: card, onRelease: onRelease), at: 0)
        players[player].inAct()
        log?.log("Player\(currentMoveIndex) push card \(card.description) for player\(player)")
    }
    
    func hardcodeSuit(_ suit: CardSuit) {
        hardcoddedSuite = suit
    }
    
    private func setPuttedCardsEffect(_ cards: [Card]) {
        let lastCard = cards.last!
        switch lastCard {
        case .two(suit: _):
            if cards.count % 2 == 1 {
                direction *= -1
                log?.log("Reverse direction")
            }
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .three(suit: _):
            (0..<cards.count).forEach({ _ in players[currentMoveIndex].stack.insert(Exchange(), at: 0) })
        case .four(suit: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .five(suit: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .six(suit: _):
            players[currentMoveIndex].stack.insert(PutCard(), at: 0)
        case .seven(suit: _):
            var skipCount = 0
            var skipIndex = 0
            while skipCount != cards.count {
                skipIndex += direction
                if (currentMoveIndex + skipIndex) % players.count == currentMoveIndex {
                    players[currentMoveIndex].stack.append(Skip())
                    continue
                }
                players[(currentMoveIndex + skipIndex) % players.count].stack.insert(TakeCard(count: 2), at: 0)
                players[(currentMoveIndex + skipIndex) % players.count].stack.insert(Skip(), at: 0)
                skipCount += 1
            }
            players[currentMoveIndex].stack.append(Skip())
        case .eight(suit: _):
            players[(currentMoveIndex + direction) % players.count].stack.insert(TakeCard(count: cards.count), at: 0)
            players[currentMoveIndex].stack.append(Skip())
        case .nine(suit: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ten(suit: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .jack(suit: _):
            players[currentMoveIndex].stack.insert(ChooseSuit(), at: 0)
        case .queen(suit: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .king(suit: _):
            if cards.contains(where: { $0 == .king(suit: .chirva) }) {
                players[(currentMoveIndex + direction) % players.count].stack.insert(TakeCard(count: 5), at: 0)
            }
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ace(suit: _):
            var skipCount = 0
            var skipIndex = 0
            while skipCount != cards.count {
                skipIndex += direction
                if (currentMoveIndex + skipIndex) % players.count == currentMoveIndex {
                    players[currentMoveIndex].stack.append(Skip())
                    continue
                }
                players[(currentMoveIndex + skipIndex) % players.count].stack.insert(Skip(), at: 0)
                skipCount += 1
            }
            players[currentMoveIndex].stack.append(Skip())
        case .joker(color: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .calendar:
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ourFather:
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        }
    }
    
}
