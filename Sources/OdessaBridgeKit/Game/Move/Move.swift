//
//  Move.swift
//
//
//  Created by Anatoliy Khramchenko on 02.01.2024.
//

import Foundation

protocol Move {
    @available(iOS 13.0.0, *)
    func make(for player: Player) async
}
