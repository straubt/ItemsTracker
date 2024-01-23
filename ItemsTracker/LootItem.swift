//
//  LootItem.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/19/24.
//

import Foundation
import SwiftUI

enum Rarity: CaseIterable{
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    func getColor() -> Color {
        switch(self){
        case Rarity.common:
            return Color.gray
        case Rarity.uncommon:
            return Color.green
        case Rarity.rare:
            return Color.blue
        case Rarity.epic:
            return Color.purple
        case Rarity.legendary:
            return Color.orange
        case Rarity.unique:
            return Color.red
        }
    }
}

enum ItemType: String, CaseIterable{
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
}

struct LootItem: Identifiable{
    var id: UUID = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
}
