//
//  FirstSet.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

public class FirstSet: Move {
    
    let isLast: Bool
    
    init(isLast: Bool) {
        self.isLast = isLast
    }
    
    func make(for player: Player) {
        player.gamePannel?.getCards(count: isLast ? 4 : 5, for: player.index!)
        if isLast {
            player.gamePannel?.putFirstCard()
        } else {
            player.stack.insert(Skip(), at: 0)
        }
    }
    
}
