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
    func add(item: ItemModel)
    func remove(item: ItemModel)
    func getItemsOrder()->[ItemModel]
    func deleteItems(at offsets: IndexSet)
    func getTotal()->Int
}

struct OrderAdapter: OrderProtocol{
            
    var shareInstance = OrderManager.instance
    
    init() {
        print("INIT VIEW...")
    }
    
    func getTotal()->Int{
        shareInstance.getTotal()
    }
    
    func add(item: ItemModel) {
        shareInstance.add(item: ItemModel.mapperModel(item: item))
    }
    
    func deleteItems(at offsets: IndexSet){
        shareInstance.deleteItems(at: offsets)
    }
    
    func remove(item: ItemModel) {
        //shareInstance.remove(item: item)
    }
    
    func getItemsOrder()->[ItemModel]{
        ItemModel.mapArray(itemsData: shareInstance.itemsOrder)
    }
}
