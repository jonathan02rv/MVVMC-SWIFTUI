//
//  OrderViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation

public protocol OrderViewModelPprotocol: ObservableObject {
    func getItemsOrder()->[ItemModel]
    func deleteItems(at offsets: IndexSet)
    func updateModel()
}

public class OrderViewModel: OrderViewModelPprotocol{
    
    @Published var itemsOrder = [ItemModel]()
 
    private var globalOrder: OrderProtocol
    
    init() {
        self.globalOrder = OrderAdapter()
    }
    
    public func getItemsOrder()->[ItemModel]{
        return globalOrder.getItemsOrder()
    }
    
    public func deleteItems(at offsets: IndexSet){
        globalOrder.deleteItems(at: offsets)
        updateModel()
    }
    
    public func updateModel(){
        itemsOrder = globalOrder.getItemsOrder()
    }
}
