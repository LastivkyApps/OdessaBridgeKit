//
//  MandatoryExchange.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class MandatoryExchange: Move {
    
    let cardIn: Card
    
    init(cardIn: Card) {
        self.cardIn = cardIn
    }
    
    func make(for player: Player) {
        ()
    }
    
}
