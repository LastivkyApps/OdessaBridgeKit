//
//  ChooseSuit.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class ChooseSuit: Move {
    
    func make(for player: Player) {
        let suit = player.chooseSuit()
        player.gamePannel?.hardcodeSuit(suit)
        player.stack.insert(Skip(), at: 0)
    }
    
}
