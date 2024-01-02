//
//  RealPlayer.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

class RealPlayer: Player {
    
    let pannel: UserPannel
    
    var index: Int?
    
    var stack = [Move]()
    
    init(pannel: UserPannel) {
        self.pannel = pannel
    }
    
    func inAct() {
        guard !stack.isEmpty else {
            return
        }
        let move = stack.removeFirst()
        move.make(for: self)
        // TODO: pannel logic
    }
    
}
