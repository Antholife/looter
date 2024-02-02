//
//  LootItem.swift
//  Looter
//
//  Created by Anthony Chahat on 10.01.2024.
//

import SwiftUI

enum ItemType: CaseIterable {
    case magic, fire, ice, wind, poison, thunder, dagger, shield, bow, ring, unknown
    func toEmoji() -> String {
        switch self {
        case .magic:
            return "⭐️"
        case .fire:
            return "🔥"
        case .ice:
            return "❄️"
        case .wind:
            return "💨"
        case .poison:
            return "☠️"
        case .thunder:
            return "⚡️"
        case .dagger:
            return "🗡️"
        case .shield:
            return "🛡️"
        case .bow:
            return "🏹"
        case .ring:
            return "💍"
        case .unknown:
            return "🎲"
        @unknown default:
            return "Unknown type"
        }
    }
}

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
    func getColors() -> Color {
        switch self {
        case .common:
            return Color.gray
        case .uncommon:
            return Color.green
        case .rare:
            return Color.blue
        case .epic:
            return Color.purple
        case .legendary:
            return Color.orange
        case .unique:
            return Color.red
        @unknown default:
            return Color.gray
        }
    }
    func toString() -> String {
        switch self {
        case .common:
            return "Common"
        case .uncommon:
            return "Uncommon"
        case .rare:
            return "Rare"
        case .epic:
            return "Epic"
        case .legendary:
            return "Legendary"
        case .unique:
            return "Unique"
        @unknown default:
            return "Unknown"
        }
    }

}
    
    struct LootItem: Hashable {
        var quantity : Int = 1
        var name : String
        var type : ItemType
        var rarity : Rarity
        var attackStrength : Int?
        var game : Game
    }
    
