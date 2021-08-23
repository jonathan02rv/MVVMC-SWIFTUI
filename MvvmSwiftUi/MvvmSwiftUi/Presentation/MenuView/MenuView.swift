//
//  MenuView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 10/08/21.
//

import SwiftUI

struct MenuView: View {
    let sections = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView{
            List{
                ForEach(sections){ section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items){ item in
                            NavigationLink(destination: ItemDetail(item: item)){
                                ItemRow(item:item)
                            }
                        }
                    }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}




