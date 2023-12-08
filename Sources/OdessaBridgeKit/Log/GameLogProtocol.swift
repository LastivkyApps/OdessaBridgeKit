//
//  GameLogProtocol.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

public class GameLog {
    
    var isLogOn = false
    
    func log(_ string: String, status: LogEventStatus = .message) {
        if isLogOn {
            print("ODESSA BRIDGE KIT: \(status.emoji) \(string)")
        }
    }
    
}

enum LogEventStatus {
    
    case message, serrios, error, start, finish
    
    var emoji: String {
        switch self {
        case .message:
            "🔵"
        case .serrios:
            "🔴"
        case .error:
            "🔺"
        case .start:
            "🟩"
        case .finish:
            "🟫"
        }
    }
    
}
