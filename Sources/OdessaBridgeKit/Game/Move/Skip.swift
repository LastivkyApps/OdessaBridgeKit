//
//  Skip.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

@available(iOS 13.0.0, *)
public class Skip: Move {
    
    func make(for player: Player) {
        player.gamePannel?.nextPlayer(playerIndex: player.index!)
    }
    
}
