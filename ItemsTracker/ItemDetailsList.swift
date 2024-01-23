//
//  ItemDetailsList.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/23/24.
//

import Foundation
import SwiftUI

struct ItemDetailsList: View {
    var item: LootItem
    var body: some View {
        List {
            Section{
                HStack{
                    Image(item.game.coverName!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 58)
                        .cornerRadius(4)
                    Text(item.game.name)
                }
                Text("In-Game : " + item.name)
                if let strength = item.attackStrength{
                    Text("Puissance (ATQ): " + String(strength))
                }
                Text("Owned : " + String(item.quantity))
                Text("Rarity : " + String(describing: item.rarity).capitalized)
            } header: {
                Text("informations")
            }
        }
    }
}
