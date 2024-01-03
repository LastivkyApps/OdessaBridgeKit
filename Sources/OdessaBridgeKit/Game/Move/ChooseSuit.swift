//
//  ChooseSuit.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

@available(iOS 13.0.0, *)
public class ChooseSuit: Move {
    
    func make(for player: Player) async {
        let suit = await player.chooseSuit()
        player.gamePannel?.hardcodeSuit(suit)
        player.stack.insert(Skip(), at: 0)
    }
    
}
