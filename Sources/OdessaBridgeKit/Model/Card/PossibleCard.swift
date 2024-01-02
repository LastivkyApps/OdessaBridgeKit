//
//  PossibleCard.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

class PossibleCard {
    
    var maybeeCards = [Card]()
    
    func removeCard(_ card: Card) {
        maybeeCards.removeAll(where: { $0 == card })
    }
    
}
