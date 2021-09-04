//
//  MockOrderView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

class MockOrderView:OrderViewModelPprotocol{
    func updateModel() {
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        
    }
    
    func getItemsOrder() -> [MenuItemModel] {
        return [MenuItemModel]()
    }
    
    func removeItemToOrder(item: MenuItemModel) {
        
    }
    
    
}
