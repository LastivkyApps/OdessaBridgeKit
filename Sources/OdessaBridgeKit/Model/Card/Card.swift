//
//  Card.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public enum Card: Equatable {
    
    case two(suit: CardSuit)
    case three(suit: CardSuit)
    case four(suit: CardSuit)
    case five(suit: CardSuit)
    case six(suit: CardSuit)
    case seven(suit: CardSuit)
    case eight(suit: CardSuit)
    case nine(suit: CardSuit)
    case ten(suit: CardSuit)
    case jack(suit: CardSuit)
    case queen(suit: CardSuit)
    case king(suit: CardSuit)
    case ace(suit: CardSuit)
    case joker(color: CardColor)
    case calendar
    case ourFather
    
}
