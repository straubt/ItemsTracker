//
//  LootDetailView.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    var body: some View {
        IconItemDetails(item: item)
        ItemDetailsList(item: item)
    }
}

#Preview {
    LootDetailView(item: LootItem(name: "Poisonous Ring", type: .ring, rarity: .unique, game: availableGames[2]))
}
