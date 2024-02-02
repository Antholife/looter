//
//  LootDetailsView.swift
//  Looter
//
//  Created by Anthony Chahat on 01.02.2024.
//

import SwiftUI

struct LootDetailsView: View {
    var item: LootItem
    var body: some View {
        Section {
                VStack {
                    Text(item.type.toEmoji())
                        .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100, alignment: .center).background(item.rarity.getColors()).cornerRadius(30)
                        .shadow(color: item.rarity.getColors(), radius: 30).font(.system(size: 50)).padding(.top, 50)
                    Text(item.name).foregroundStyle(item.rarity.getColors()).bold().font(.system(size: 30))
                    if (item.rarity == Rarity.unique){
                        Text("Item unique 🏆")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center).background(item.rarity.getColors()).cornerRadius(15)
                            .font(.system(size: 20)).bold().foregroundColor(.white)
                            .padding(.top, 80)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity).padding(.horizontal, 25)
        }
        Form {
            Section(header: Text("Informations")) {
                VStack(alignment: .leading) {
                    HStack {
                        if let cover = item.game.coverName {
                            
                        } else {
                            VStack {
                                Image(systemName: "rectangle.slash").padding(.horizontal, 8)
                            }.frame(minHeight: 58, maxHeight: 58).background(
                                LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .top, endPoint: .bottom)
                                    .opacity(0.4)
                            ).cornerRadius(4)
                        }
                        Text(item.game.name)
                    }
                    Divider()
                    Text("In-game: \(item.name)")
                    Divider()
                    if let attackStrength = item.attackStrength {
                        Text("Puissance(ATQ): \(attackStrength)")
                        Divider()
                    }
                    Text("Possédé(s): \(item.quantity)")
                    Divider()
                    Text("Rareté: \(item.rarity.toString())")
                }
            }
        }
    }
}

#Preview {
    LootDetailsView(item: LootItem(quantity: 4, name: "Epée du désespoir", type: ItemType.dagger, rarity: Rarity.unique, attackStrength: 45, game: Game(name: "Test", genre: GameGenre.mmorpg, coverName: nil)))
}
