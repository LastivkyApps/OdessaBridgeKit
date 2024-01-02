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
    
    private var players: [Player]
    
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
            if players.count == 1 {
                log?.log("finish")
                return
            }
            callMove()
        }
    }
    
}

extension Game: GamePannel {
    
    var playersCount: Int {
        return players.count
    }
    
    var suit: [CardSuit] {
        if let hardcoddedSuite {
            return [hardcoddedSuite]
        }
        return (field.last?.suit ?? [.cross])
    }
    
    var cardValue: [CardValue] {
        return field.last?.possibleValue ?? [.two]
    }
    
    func getCards(count: Int = 1, for playerIndex: Int) {
        if deck.count >= count {
            var cards = [Card]()
            (0..<count).forEach({ _ in cards.append(deck.removeFirst()) })
            players[playerIndex].pushCards(cards)
            log?.log("Player\(playerIndex) get cards: \(cards.map({ $0.description }))")
        } else {
            let lastInField = field.removeLast()
            deck += field
            field = [lastInField]
            deck = deck.shuffled()
        }
    }
    
    func nextPlayer(playerIndex: Int) {
        currentMoveIndex = (playerIndex + direction + players.count) % players.count
        log?.log("Next move is in player\(currentMoveIndex) with cards \(players[currentMoveIndex].cardsInHand.map({ $0.description }))")
    }
    
    func putFirstCard() {
        field.append(deck.removeFirst())
        log?.log("Card \(field[0].description) was putted automatically")
        setPuttedCardsEffect([field[0]])
    }
    
    func putCards(_ cards: [Card]) {
        hardcoddedSuite = nil
        log?.log("Player\(currentMoveIndex) put cards \(cards.map({ $0.description }))")
        field += cards
        setPuttedCardsEffect(cards)
    }
    
    func makeExchange(with player: Int, for card: Card, onRelease: @escaping (Card) -> Void) {
        players[player].stack.insert(MandatoryExchange(cardIn: card, onRelease: onRelease), at: 0)
        players[player].inAct()
        log?.log("Player\(currentMoveIndex) push card \(card.description) for player\(player)")
    }
    
    func hardcodeSuit(_ suit: CardSuit) {
        hardcoddedSuite = suit
        log?.log("Player\(currentMoveIndex) choose \(suit) suit")
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
                if (currentMoveIndex + skipIndex + players.count) % players.count == currentMoveIndex {
                    players[currentMoveIndex].stack.append(Skip())
                    continue
                }
                players[(currentMoveIndex + skipIndex + players.count) % players.count].stack.insert(TakeCard(count: 2), at: 0)
                players[(currentMoveIndex + skipIndex + players.count) % players.count].stack.append(Skip())
                skipCount += 1
            }
            players[currentMoveIndex].stack.append(Skip())
        case .eight(suit: _):
            players[(currentMoveIndex + direction + players.count) % players.count].stack.insert(TakeCard(count: cards.count), at: 0)
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
                players[(currentMoveIndex + direction + players.count) % players.count].stack.insert(TakeCard(count: 5), at: 0)
            }
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ace(suit: _):
            var skipCount = 0
            var skipIndex = 0
            while skipCount != cards.count {
                skipIndex += direction
                if (currentMoveIndex + skipIndex + players.count) % players.count == currentMoveIndex {
                    players[currentMoveIndex].stack.append(Skip())
                    continue
                }
                players[(currentMoveIndex + skipIndex + players.count) % players.count].stack.insert(Skip(), at: 0)
                skipCount += 1
            }
            players[currentMoveIndex].stack.append(Skip())
        case .joker(color: _):
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .calendar:
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        case .ourFather:
            if field.count > 1 && field[field.count - 2].value == .calendar {
                win()
                return
            }
            if field.count > 2 && field[field.count - 2].value == .joker && field[field.count - 3].value == .joker {
                win()
                return
            }
            if field.count > 4 && field[field.count - 2].value == field[field.count - 3].value && field[field.count - 4].value == field[field.count - 3].value && field[field.count - 4].value == field[field.count - 5].value {
                win()
                return
            }
            players[currentMoveIndex].stack.insert(Skip(), at: 0)
        }
        if lastCard.value != .six && players[currentMoveIndex].cardsInHand.isEmpty {
            win()
        }
    }
    
    private func win() {
        log?.log("Player\(currentMoveIndex) WIN!!!")
        players.remove(at: currentMoveIndex)
        players.enumerated().forEach({ index, player in
            player.index = index
        })
        if direction < 0 {
            currentMoveIndex -= 1
        }
        currentMoveIndex = (currentMoveIndex + players.count) % players.count
    }
    
}
