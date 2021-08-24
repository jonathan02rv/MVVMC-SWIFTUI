//
//  ItemRow.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 10/08/21.
//

import SwiftUI

struct ItemRow: View {
        
    let item: MenuItemModel
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 3.0))
            VStack(alignment: .leading){
                Text(item.name).font(.caption)
                Text("$\(item.price)")
            }
            
            Spacer()
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItemModel.example)
    }
}
