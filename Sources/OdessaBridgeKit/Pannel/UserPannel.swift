//
//  UserPannel.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

@available(iOS 13.0.0, *)
public protocol UserPannel: AnyObject {
    func setIndex(_ index: Int)
    func pushCards(_ cards: [Card])
    func getCard(_ card: Card)
    @available(iOS 13.0.0, *)
    func chooseExchangeCard() async -> Card
    @available(iOS 13.0.0, *)
    func choosePlayerForExchange() async -> Int
    func chooseSuit() async -> CardSuit
    func chooseCards() async -> [Card]?
    
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
