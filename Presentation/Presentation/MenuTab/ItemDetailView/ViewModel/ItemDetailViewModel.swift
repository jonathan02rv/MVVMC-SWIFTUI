//
//  ItemDetailViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation

public protocol ItemDetailViewModelProtocol: ObservableObject{
    func getItemData()->ItemModel
    func addItemToOrder(item: ItemModel)
}

public class ItemDetailViewModel: ItemDetailViewModelProtocol{
    @Published var itemMenu: ItemModel
    
    private var globalOrder: OrderProtocol?
    
    public init(itemMenu: ItemModel) {
        self.itemMenu = itemMenu
        self.globalOrder = OrderAdapter()
    }
    
    public func getItemData()->ItemModel{
        return itemMenu
    }
    
    public func addItemToOrder(item: ItemModel){
        globalOrder?.add(item: item)
    }
}


