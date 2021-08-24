//
//  ItemDetail.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 12/08/21.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    
    let item: MenuItemModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description).padding().minimumScaleFactor(0.5)
            Button("Order This") {
                order.add(item: item)
            }.font(.headline)
        }
        .navigationBarTitle("\(item.name)", displayMode: .inline)
        
        Spacer()
    }
}

struct ItemDetal_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ItemDetail(item: MenuItemModel.example)
                    .environmentObject(Order())
            }
        }
    }
}
