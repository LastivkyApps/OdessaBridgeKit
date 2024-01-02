//
//  Player.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

protocol Player: AnyObject {
    
    var index: Int? { get set }
    var gamePannel: GamePannel? { get set }
    
    var stack: [Move] { get set }
    
    var cardsInHand: [Card] { get }
    
    func inAct()
    
    func pushCards(_ cards: [Card])
    
    func chooseExchangeCard() -> Card
    
    func choosePlayerForExchange() -> Int
    
    func getRandomCard() -> Card
    
    func chooseSuit() -> CardSuit
    
    func chooseCards() -> [Card]?
    
    
    func gameFinishedNotify()
    func getCardsNotify(player: Int, count: Int)
    func deckRefreshNotify()
    func moveTransferNotify(to plyaer: Int)
    func firstCardPuttedNotify(card: Card)
    func cardsPuttedNotify(by player: Int, card: [Card])
    func exchangeNotify(from player1: Int, to player2: Int)
    func hardcodeSuitNotify(newSuit: CardSuit)
    func playerWinNotify(_ player: Int)
    func reverseNotify()
    
}
