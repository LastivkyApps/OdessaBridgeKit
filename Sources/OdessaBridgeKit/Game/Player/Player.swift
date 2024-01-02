//
//  Player.swift
//
//
//  Created by Anatoliy Khramchenko on 08.12.2023.
//

import Foundation

protocol Player: AnyObject {
    
    var index: Int? { get set }
    
    var stack: [Move] { get set }
    
    func inAct()
    
}
