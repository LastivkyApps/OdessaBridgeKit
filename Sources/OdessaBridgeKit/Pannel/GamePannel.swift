//
//  GamePannel.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public protocol GamePannel: AnyObject {
    
    var playersCount: Int { get }
    
    func getCards(count: Int, for playerIndex: Int)
    func nextPlayer(playerIndex: Int)
    func putFirstCard()
    func makeExchange(with player: Int, for card: Card, onRelease: @escaping (Card) -> Void)
    
}
