//
//  ItemRow.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 10/08/21.
//

import SwiftUI

struct ItemRow<ViewModel>: View where ViewModel: MenuViewModelProtocol{
    
    @ObservedObject var viewModel: ViewModel
    @State var idItem:String
    @State var sectionId:String
    
    var body: some View {
        let item = viewModel.getItemData(sectionId: sectionId, idItem: idItem)
        HStack{
            Image(item.thumbnailImage).cornerRadius(10.0)
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
        ItemRow(viewModel: MockMenuVieModel(), idItem: "", sectionId: "")
    }
}

