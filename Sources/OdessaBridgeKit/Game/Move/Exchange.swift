//
//  Exchange.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

@available(iOS 13.0.0, *)
public class Exchange: Move {
    
    func make(for player: Player) async {
        let card = await player.chooseExchangeCard()
        let playerForExchange = await player.choosePlayerForExchange()
        await player.gamePannel?.makeExchange(with: playerForExchange, for: card, onRelease: { newCard in
            player.pushCards([newCard])
            if player.stack.isEmpty {
                player.stack.insert(Skip(), at: 0)
            }
        })
    }
    
}
