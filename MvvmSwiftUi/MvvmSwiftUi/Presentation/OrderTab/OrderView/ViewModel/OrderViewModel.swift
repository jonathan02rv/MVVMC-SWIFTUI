//
//  OrderViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

protocol OrderViewModelPprotocol: ObservableObject {
    func getItemsOrder()->[MenuItemModel]
    func deleteItems(at offsets: IndexSet)
    func updateModel()
}

class OrderViewModel: OrderViewModelPprotocol{
    
    @Published var itemsOrder = [MenuItemModel]()
 
    private var globalOrder: OrderProtocol
    
    init() {
        self.globalOrder = OrderAdapter()
    }
    
    func getItemsOrder()->[MenuItemModel]{
        return globalOrder.getItemsOrder()
    }
    
    func deleteItems(at offsets: IndexSet){
        globalOrder.deleteItems(at: offsets)
        updateModel()
    }
    
    func updateModel(){
        itemsOrder = globalOrder.getItemsOrder()
    }
}
