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
    
    var description: String {
        switch self {
        case .two(let suit):
            "2\(suit.description)"
        case .three(let suit):
            "3\(suit.description)"
        case .four(let suit):
            "4\(suit.description)"
        case .five(let suit):
            "5\(suit.description)"
        case .six(let suit):
            "6\(suit.description)"
        case .seven(let suit):
            "7\(suit.description)"
        case .eight(let suit):
            "8\(suit.description)"
        case .nine(let suit):
            "9\(suit.description)"
        case .ten(let suit):
            "10\(suit.description)"
        case .jack(let suit):
            "J\(suit.description)"
        case .queen(let suit):
            "Q\(suit.description)"
        case .king(let suit):
            "K\(suit.description)"
        case .ace(let suit):
            "A\(suit.description)"
        case .joker(let color):
            "Joker\(color.description)"
        case .calendar:
            "calendar"
        case .ourFather:
            "ourFather"
        }
    }
    
    static var deck: [Card] {
        return [
            .two(suit: .cross), .two(suit: .peak), .two(suit: .chirva), .two(suit: .tambourine),
            .three(suit: .cross), .three(suit: .peak), .three(suit: .chirva), .three(suit: .tambourine),
            .four(suit: .cross), .four(suit: .peak), .four(suit: .chirva), .four(suit: .tambourine),
            .five(suit: .cross), .five(suit: .peak), .five(suit: .chirva), .five(suit: .tambourine),
            .six(suit: .cross), .six(suit: .peak), .six(suit: .chirva), .six(suit: .tambourine),
            .seven(suit: .cross), .seven(suit: .peak), .seven(suit: .chirva), .seven(suit: .tambourine),
            .eight(suit: .cross), .eight(suit: .peak), .eight(suit: .chirva), .eight(suit: .tambourine),
            .nine(suit: .cross), .nine(suit: .peak), .nine(suit: .chirva), .nine(suit: .tambourine),
            .ten(suit: .cross), .ten(suit: .peak), .ten(suit: .chirva), .ten(suit: .tambourine),
            .jack(suit: .cross), .jack(suit: .peak), .jack(suit: .chirva), .jack(suit: .tambourine),
            .queen(suit: .cross), .queen(suit: .peak), .queen(suit: .chirva), .queen(suit: .tambourine),
            .king(suit: .cross), .king(suit: .peak), .king(suit: .chirva), .king(suit: .tambourine),
            .ace(suit: .cross), .ace(suit: .peak), .ace(suit: .chirva), .ace(suit: .tambourine),
            .joker(color: .black), .joker(color: .red),
            .calendar,
            .ourFather
        ]
    }
    
}
