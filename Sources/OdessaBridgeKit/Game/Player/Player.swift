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
    
}
