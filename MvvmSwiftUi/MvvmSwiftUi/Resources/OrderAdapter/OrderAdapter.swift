//
//  OrderAdapter.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain
import SwiftUI

protocol OrderProtocol {
    func add(item: MenuItemModel)
    func remove(item: MenuItemModel)
    func getItemsOrder()->[MenuItemModel]
    func deleteItems(at offsets: IndexSet)
}

struct OrderAdapter: OrderProtocol{
            
    @ObservedObject var shareInstance = OrderManagerAUX.instance
    
    init() {
        print("INIT VIEW...")
    }
    
    func add(item: MenuItemModel) {
        shareInstance.add(item: item)
    }
    
    func deleteItems(at offsets: IndexSet){
        shareInstance.deleteItems(at: offsets)
    }
    
    func remove(item: MenuItemModel) {
        //shareInstance.remove(item: item)
    }
    
    func getItemsOrder()->[MenuItemModel]{
        shareInstance.itemsOrder
    }
}
