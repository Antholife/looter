//
//  Game.swift
//  Looter
//
//  Created by Anthony Chahat on 10.01.2024.
//

import SwiftUI

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: nil),
    Game(name: "Skyrim", genre: .rpg, coverName: nil),
    Game(name: "WoW", genre: .mmorpg, coverName: nil),
    Game(name: "CS:GO", genre: .fps, coverName: nil),
    Game(name: "Diablo IV", genre: .looter, coverName: nil)
]
