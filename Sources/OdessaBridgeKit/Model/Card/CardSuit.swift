//
//  CardSuit.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public enum CardSuit {
    
    case cross, peak, chirva, tambourine
    
    var color: CardColor {
        switch self {
        case .cross, .peak:
            return .black
        case .chirva, .tambourine:
            return .red
        }
    }
    
}
