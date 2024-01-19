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
        VStack{
            Text(item.type.rawValue)
                .padding(.all, 20)
                .background(item.rarity.getColor())
                .shadow(radius:30)
                .font(.system(size: 100))
                .cornerRadius(30)
            Text(item.name)
                .font(.largeTitle)
                .foregroundStyle(item.rarity.getColor())
                .bold()
        }.frame(height: 300)
        if(item.rarity == Rarity.unique){
            Text("Item Unique 🏆")
                .frame(minWidth: 80, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .background(item.rarity.getColor())
                .cornerRadius(30)
                .foregroundStyle(Color.white)
                .bold()
                .padding(10)
        }
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

#Preview {
    LootDetailView(item: LootItem(quantity: 1, name: "myItem", type: ItemType.dagger, rarity: Rarity.unique, attackStrength: 500, game: availableGames[0]))
}
