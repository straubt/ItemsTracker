//
//  LootDetailView.swift
//  ItemsTracker
//
//  Created by Titouan STRAUB on 1/19/24.
//

import SwiftUI

struct LootDetailView: View {
    var item: LootItem
    @State private var animationxAmount = 0.0
    @State private var animationyAmount = 0.0
    @State private var animationShadowAmount = 0.0
    @State private var scaleEffect = 0.0
    var body: some View {
        VStack{
            Text(item.type.rawValue)
                .font(.system(size: 80))
                .padding(.all, 20)
                .background(item.rarity.getColor())
                .cornerRadius(30)
                .scaleEffect(animationyAmount)
                .shadow(color:item.rarity.getColor(), radius: animationShadowAmount)
            Text(item.name)
                .font(.largeTitle)
                .foregroundStyle(item.rarity.getColor())
                .bold()
        }.frame(height: 360)
            .onAppear{
                Task{
                    try await Task.sleep(nanoseconds: 400_000_000)
                    withAnimation(
                        .bouncy.speed(0.6),
                        completionCriteria: .logicallyComplete){
                            animationyAmount += 1
                        } completion: {
                            Task{
                                try await Task.sleep(nanoseconds: 200_000_000)
                                withAnimation(
                                    .bouncy.speed(0.6)
                                ){
                                    animationShadowAmount += 100
                                }
                            }
                        }
                }
            }
        if(item.rarity == Rarity.unique){
            Text("Item Unique 🏆")
                .frame(minWidth: 80, maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                .background(item.rarity.getColor())
                .cornerRadius(30)
                .foregroundStyle(Color.white)
                .bold()
                .padding(10)
                .scaleEffect(scaleEffect)
                .rotation3DEffect(
                    .degrees(animationxAmount),
                    axis: (x: 0, y: 0, z: 1)
                )
                .onAppear{
                    withAnimation(.bouncy.speed(0.8)){
                        scaleEffect += 1
                    }
                    withAnimation(.spring(duration: 1)){
                        animationxAmount += 720
                    }
                }
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
    LootDetailView(item: LootItem(name: "Poisonous Ring", type: .ring, rarity: .unique, game: availableGames[2]))
}
