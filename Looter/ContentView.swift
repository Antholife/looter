//
//  ContentView.swift
//  Looter
//
//  Created by Anthony Chahat on 10.01.2024.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var data: [LootItem] = [LootItem(quantity: 4, name: "Test", type: ItemType.fire, rarity: Rarity.legendary, game: Game(name: "Test", genre: GameGenre.mmorpg, coverName: "Cover"))]
    func addItem(item: LootItem) {
            data.append(item)
    }
}
struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var addItemSheetPresented: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(inventory.data, id: \.self) { item in
                    NavigationLink(destination: LootDetailsView(item: item)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Circle().fill(item.rarity.getColors()).frame(width: 10)
                                Text(item.name)
                                Spacer()
                                Text(item.type.toEmoji())
                            }
                            Text("Quantité: \(item.quantity)")
                        }
                    }
                }
            }
            .sheet(isPresented: $addItemSheetPresented,
               content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationTitle("👝 Inventaire")
                .toolbar(content: {
                    ToolbarItem(placement: .automatic) {
                        Button(action: {
                            addItemSheetPresented.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                            }
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
