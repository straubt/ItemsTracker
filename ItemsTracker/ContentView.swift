//
//  ContentView.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/19/24.
//

import SwiftUI
import Charts

class Inventory: ObservableObject {
    @Published var loot = [
        LootItem(name: "Sword of Flames", type: .fire, rarity: .epic, attackStrength: 25, game: availableGames[0]),
        LootItem(name: "Frozen Bow", type: .ice, rarity: .rare, attackStrength: 18, game: availableGames[1]),
        LootItem(name: "Thunder Dagger", type: .thunder, rarity: .legendary, attackStrength: 30, game: availableGames[3]),
        LootItem(name: "Poisonous Ring", type: .ring, rarity: .unique, game: availableGames[2]),
        LootItem(name: "Mysterious Scroll", type: .unknown, rarity: .common, game: availableGames[4]),
        LootItem(name: "Wind Blade", type: .wind, rarity: .rare, attackStrength: 20, game: availableGames[1]),
        LootItem(name: "Magic Shield", type: .shield, rarity: .epic, game: availableGames[4]),
        LootItem(name: "Ancient Bow", type: .bow, rarity: .legendary, attackStrength: 35, game: availableGames[0]),
        LootItem(name: "Invisibility Cloak", type: .unknown, rarity: .unique, game: availableGames[2]),
        LootItem(name: "Venomous Dagger", type: .dagger, rarity: .rare, attackStrength: 22, game: availableGames[3])
    ]

    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    @State var showAddItemView = false
    var body: some View {
        NavigationStack{
            List {
//                Button(action: {
//                    inventory.addItem(item: "magie de feu")
//                }, label: {
//                    Text("Ajouter")
//                })
                
                ForEach(inventory.loot) { item in
                    NavigationLink{
                        LootDetailView(item: item)
                    } label: {
                        LootRow(item: item)
                    }
                }
                Section{
                    Text("Your most powerfull weapons")
                    Chart(inventory.loot){ item in
                        if let strength = item.attackStrength{
                            BarMark(
                                x: .value("Item", item.name),
                                y: .value("ATQ", strength)
                            )
                        }
                    }
                } header: {
                    Text("Statistiques")
                }
            }.sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationTitle("Loot")
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
