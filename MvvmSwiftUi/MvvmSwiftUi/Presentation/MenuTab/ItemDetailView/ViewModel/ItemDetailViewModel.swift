//
//  ItemDetailViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
import Domain

protocol ItemDetailViewModelProtocol: ObservableObject{
    func getItemData()->MenuItemModel
    func addItemToOrder(item: MenuItemModel)
}

class ItemDetailViewModel: ItemDetailViewModelProtocol{
    @Published var itemMenu: MenuItemModel
    
    private var globalOrder: OrderProtocol?
    
    init(itemMenu: MenuItemModel) {
        self.itemMenu = itemMenu
        self.globalOrder = OrderAdapter()
    }
    
    func getItemData()->MenuItemModel{
        return itemMenu
    }
    
    func addItemToOrder(item: MenuItemModel){
        globalOrder?.add(item: item)
    }
}


