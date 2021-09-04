//
//  MockItemDetailViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
import Domain

class MockItemDetailViewModel:ItemDetailViewModelProtocol{
    func addItemToOrder(item: MenuItemModel) {
    }
    
    func getItemData() -> MenuItemModel {
        return MenuItemModel.emptyItem
    }
}
