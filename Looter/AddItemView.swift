//
//  AddItemView.swift
//  Looter
//
//  Created by Anthony Chahat on 10.01.2024.
//

import SwiftUI

struct AddItemView: View {
    
    @State var quantity: Int = 0
    @State var name: String = ""
    @State var type: ItemType = ItemType.unknown
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = availableGames[0]
    @State var toggle: Bool = false
    @State var attackStrength: Int = 0
    
    
    @EnvironmentObject var inventory: Inventory
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        TextField("", text: $name, prompt: Text("Nom de l'item").foregroundColor(Color.blue.opacity(0.4)))
                        Divider()
                        Picker("Rareté", selection: $rarity) {
                            ForEach(Rarity.allCases, id: \.self) { rarity in
                                Text(String(describing: rarity).capitalized)
                            }
                        }
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                Section {
                    VStack {
                        Picker("Jeu", selection: $game) {
                            ForEach(availableGames, id: \.self) { game in
                                Text(String(describing: game.name).capitalized)
                            }
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Divider()
                        Stepper(value: $quantity, in: 0...20, label: {
                            Text("Combien : \(quantity)")
                        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                Section {
                    VStack {
                        HStack {
                            Text("Type").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Text(type.toEmoji())
                        }
                        Divider()
                        Picker("", selection: $type) {
                            ForEach(ItemType.allCases, id: \.self) { type in
                                Text(String(describing: type.toEmoji()).capitalized)
                            }
                        }.pickerStyle(.segmented)
                    }
                }
                Section {
                    VStack {
                        HStack {
                            Text("Item d'attaque ?").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Toggle(isOn: $toggle, label: {})
                        }
                        if(toggle){
                            Stepper(value: $attackStrength, in: 0...999, label: {
                                Text("Force : \(attackStrength)")
                            })
                        }
                    }
                }
                Button(action: {
                    inventory.addItem(item: LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attackStrength: attackStrength, game: game))
                    dismiss()
                }, label: {
                    Text("Ajouter l'item").frame(minWidth: 0, maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
            }.navigationTitle("🧳 Ajouter un item")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddItemView()
}
