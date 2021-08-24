//
//  ItemDetail.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 12/08/21.
//

import SwiftUI
import Domain

struct ItemDetail<ViewModel>: View where ViewModel: ItemDetailViewModelProtocol{
    
    @EnvironmentObject var order: Order
        //var mainImage: String
    //var photoCredit: String
    //var description: String
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        let item = viewModel.getItemData()
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
                //viewModel.addOrder(sectionId: sectionId, idItem: idItem)
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
                ItemDetail(viewModel: MockItemDetailViewModel())
            }
        }
    }
}
