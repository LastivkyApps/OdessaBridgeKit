//
//  MandatoryExchange.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class MandatoryExchange: Move {
    
    let cardIn: Card
    let onRelease: (Card) -> Void
    
    init(cardIn: Card, onRelease: @escaping (Card) -> Void) {
        self.cardIn = cardIn
        self.onRelease = onRelease
    }
    
    func make(for player: Player) {
        let cardOut = player.getRandomCard()
        player.pushCards([cardIn])
        onRelease(cardOut)
    }
    
}
