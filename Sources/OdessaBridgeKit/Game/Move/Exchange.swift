//
//  Exchange.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class Exchange: Move {
    
    func make(for player: Player) {
        let card = player.chooseExchangeCard()
        let playerForExchange = player.choosePlayerForExchange()
        player.gamePannel?.makeExchange(with: playerForExchange, for: card, onRelease: { newCard in
            player.pushCards([newCard])
            if player.stack.isEmpty {
                player.stack.insert(Skip(), at: 0)
            }
        })
    }
    
}
