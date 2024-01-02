//
//  CardColor.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public enum CardColor {
    
    case red, black
    
    var description: String {
        switch self {
        case .red:
            "🟥"
        case .black:
            "⬛️"
        }
    }
    
}
