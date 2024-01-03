//
//  PutCard.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class PutCard: Move {
    
    @available(iOS 13.0.0, *)
    func make(for player: Player) async {
        if let cards = await player.chooseCards() {
            player.gamePannel?.putCards(cards)
        } else {
            player.stack.append(TakeCard())
            if player.gamePannel?.cardValue != [.six] {
                player.stack.append(Skip())
            } else {
                player.stack.append(PutCard())
            }
        }
    }
    
}
