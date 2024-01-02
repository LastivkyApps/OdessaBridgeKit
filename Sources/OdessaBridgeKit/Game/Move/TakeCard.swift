//
//  TakeCard.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class TakeCard: Move {
    
    let count: Int
    
    init(count: Int = 1) {
        self.count = count
    }
    
    func make(for player: Player) {
        player.gamePannel?.getCards(count: count, for: player.index!)
    }
    
}
