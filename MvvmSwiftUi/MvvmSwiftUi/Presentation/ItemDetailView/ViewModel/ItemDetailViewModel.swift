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
}

class ItemDetailViewModel: ItemDetailViewModelProtocol{
    @Published var itemMenu: MenuItemModel
    
    init(itemMenu: MenuItemModel) {
        self.itemMenu = itemMenu
    }
    
    func getItemData()->MenuItemModel{
        return itemMenu
    }
}
