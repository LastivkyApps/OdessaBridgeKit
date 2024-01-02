//
//  RandomBotPlayer.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class RandomBotPlayer: Player {
    
    var index: Int?
    
    var stack = [Move]()
    
    func inAct() {
        guard !stack.isEmpty else {
            return
        }
        let move = stack.removeFirst()
        move.make(for: self)
    }
    
}
