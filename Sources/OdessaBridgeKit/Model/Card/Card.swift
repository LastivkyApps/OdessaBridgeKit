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
    
    var suit: [CardSuit] {
        switch self {
        case .two(let suit):
            [suit]
        case .three(let suit):
            [suit]
        case .four(let suit):
            [suit]
        case .five(let suit):
            [suit]
        case .six(let suit):
            [suit]
        case .seven(let suit):
            [suit]
        case .eight(let suit):
            [suit]
        case .nine(let suit):
            [suit]
        case .ten(let suit):
            [suit]
        case .jack(let suit):
            [suit]
        case .queen(let suit):
            [suit]
        case .king(let suit):
            [suit]
        case .ace(let suit):
            [suit]
        case .joker(let color):
            color.suit
        case .calendar:
            [CardSuit.cross, .peak, .chirva, .tambourine]
        case .ourFather:
            [CardSuit.cross, .peak, .chirva, .tambourine]
        }
    }
    
    var possibleValue: [CardValue] {
        switch self {
        case .two(_):
            [CardValue.two]
        case .three(let suit):
            [CardValue.three]
        case .four(let suit):
            [CardValue.four]
        case .five(let suit):
            [CardValue.five]
        case .six(let suit):
            [CardValue.six]
        case .seven(let suit):
            [CardValue.seven]
        case .eight(let suit):
            [CardValue.eight]
        case .nine(let suit):
            [CardValue.nine]
        case .ten(let suit):
            [CardValue.ten]
        case .jack(let suit):
            [CardValue.jack]
        case .queen(let suit):
            [CardValue.queen]
        case .king(let suit):
            [CardValue.king]
        case .ace(let suit):
            [CardValue.ace]
        case .joker(let color):
            [CardValue.joker]
        case .calendar:
            [CardValue.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace, .joker, .calendar, .ourFather]
        case .ourFather:
            [CardValue.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace, .joker, .calendar, .ourFather]
        }
    }
    
    var value: CardValue {
        switch self {
        case .two(let suit):
            return .two
        case .three(let suit):
            return .three
        case .four(let suit):
            return .four
        case .five(let suit):
            return .five
        case .six(let suit):
            return .six
        case .seven(let suit):
            return .seven
        case .eight(let suit):
            return .eight
        case .nine(let suit):
            return .nine
        case .ten(let suit):
            return .ten
        case .jack(let suit):
            return .jack
        case .queen(let suit):
            return .queen
        case .king(let suit):
            return .king
        case .ace(let suit):
            return .ace
        case .joker(let color):
            return .joker
        case .calendar:
            return .calendar
        case .ourFather:
            return .ourFather
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

public enum CardValue {
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    case joker
    case calendar
    case ourFather
}
