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
    func addOrder(item: MenuItemModel)
}

class ItemDetailViewModel: ItemDetailViewModelProtocol{
    @Published var itemMenu: MenuItemModel
    
    weak var globalOrder: OrderProtocol?
    
    init(itemMenu: MenuItemModel) {
        self.itemMenu = itemMenu
        self.globalOrder = Order.instance
    }
    
    func getItemData()->MenuItemModel{
        return itemMenu
    }
    
    func addOrder(item: MenuItemModel){
        globalOrder?.add(item: item)
    }
}
