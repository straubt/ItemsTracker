//
//  AddItemView.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/19/24.
//

import SwiftUI

struct AddItemView: View {
    var step = 1
    var range = 1...1000000
    @State private var quantity = 1
    @State private var attack = 1
    @State private var rarity = Rarity.common
    @State private var game: Game = Game.emptyGame
    @State private var name = ""
    @State private var type: ItemType = ItemType.unknown
    @State private var attackItem: Bool = false
    @EnvironmentObject var inventory: Inventory
    @Environment(\.dismiss) private var dissmis
    func incrementStep(_ value: inout Int) {
        value += 1
    }
    func decrementStep(_ value: inout Int) {
        value -= 1
    }
    var body: some View {
        Form { // Wrapper de notre formulaire
            Section { // Correspond à une section du formulaire
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            Section {
                Picker("Jeu", selection: $game) {
                    Text("Undefined game")
                    ForEach(availableGames, id: \.self) { game in
                        Text(game.name)
                    }
                }
                Stepper(value: $quantity, in:range, step: step) {
                    Text("Quantity : " + String(quantity))
                }
            }
            Section{
                HStack{
                    Text("Type")
                    Spacer()
                    Text(type.rawValue)
                }
                Picker("Type", selection: $type){
                    ForEach(ItemType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }.pickerStyle(.palette)
            }
            Section{
                Toggle("Attack Item ?", isOn: $attackItem)
                if(attackItem){
                    Stepper(value: $attack, in: range, step: step) {
                        Text("Stength : " + String(attack))
                    }
                }
            }
            Button(action: {
                inventory.addItem(item: LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attack, game: game))
                dissmis()
            }){
                Text("Add Item")
            }
        }
    }
}

#Preview {
    AddItemView()
}
