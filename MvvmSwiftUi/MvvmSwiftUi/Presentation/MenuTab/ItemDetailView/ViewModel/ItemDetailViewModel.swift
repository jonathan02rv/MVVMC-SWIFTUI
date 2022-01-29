//
//  ItemDetailViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation

protocol ItemDetailViewModelProtocol: ObservableObject{
    func getItemData()->ItemModel
    func addItemToOrder(item: ItemModel)
}

class ItemDetailViewModel: ItemDetailViewModelProtocol{
    @Published var itemMenu: ItemModel
    
    private var globalOrder: OrderProtocol?
    
    init(itemMenu: ItemModel) {
        self.itemMenu = itemMenu
        self.globalOrder = OrderAdapter()
    }
    
    func getItemData()->ItemModel{
        return itemMenu
    }
    
    func addItemToOrder(item: ItemModel){
        globalOrder?.add(item: item)
    }
}


