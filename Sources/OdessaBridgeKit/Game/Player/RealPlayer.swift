//
//  RealPlayer.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class RealPlayer: Player {
    
    let pannel: UserPannel
    
    var index: Int? {
        didSet {
            pannel.setIndex(index!)
        }
    }
    weak var gamePannel: GamePannel?
    
    var stack = [Move]()
    
    private(set) var cardsInHand = [Card]()
    
    init(pannel: UserPannel) {
        self.pannel = pannel
    }
    
    func inAct() async {
        guard !stack.isEmpty else {
            stack.append(PutCard())
            return
        }
        let move = stack.removeFirst()
        await move.make(for: self)
    }
    
    func pushCards(_ cards: [Card]) {
        cardsInHand += cards
        pannel.pushCards(cards)
    }
    
    func getRandomCard() -> Card {
        let card = cardsInHand.randomElement()!
        cardsInHand.removeAll(where: { $0 == card })
        pannel.getCard(card)
        return card
    }
    
    func chooseExchangeCard() async -> Card {
        await pannel.chooseExchangeCard()
    }
    
    func choosePlayerForExchange() async -> Int {
        await pannel.choosePlayerForExchange()
    }
    
    func chooseSuit() async -> CardSuit {
        await pannel.chooseSuit()
    }
    
    func chooseCards() async -> [Card]? {
        let cards = await pannel.chooseCards()
        if let cards {
            for card in cards {
                cardsInHand.removeAll(where: { $0 == card })
            }
        }
        return cards
    }
    
    func gameFinishedNotify() {
        pannel.gameFinishedNotify()
    }
    
    func getCardsNotify(player: Int, count: Int) {
        pannel.getCardsNotify(player: player, count: count)
    }
    
    func deckRefreshNotify() {
        pannel.deckRefreshNotify()
    }
    
    func moveTransferNotify(to plyaer: Int) {
        pannel.moveTransferNotify(to: plyaer)
    }
    
    func firstCardPuttedNotify(card: Card) {
        pannel.firstCardPuttedNotify(card: card)
    }
    
    func cardsPuttedNotify(by player: Int, card: [Card]) {
        pannel.cardsPuttedNotify(by: player, card: card)
    }
    
    func exchangeNotify(from player1: Int, to player2: Int) {
        pannel.exchangeNotify(from: player1, to: player2)
    }
    
    func hardcodeSuitNotify(newSuit: CardSuit) {
        pannel.hardcodeSuitNotify(newSuit: newSuit)
    }
    
    func playerWinNotify(_ player: Int) {
        pannel.playerWinNotify(player)
    }
    
    func reverseNotify() {
        pannel.reverseNotify()
    }
    
}
