//
//  OrderManager.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation

import Domain

class OrderManager: ObservableObject {
    
    static var instance = OrderManager()
    private init(){}
    
    @Published var itemsOrder = [MenuItemModel]()

    var total: Int {
        if itemsOrder.count > 0 {
            return itemsOrder.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: MenuItemModel) {
        itemsOrder.append(item)
    }

    func remove(item: MenuItemModel) {
        if let index = itemsOrder.firstIndex(of: item) {
            itemsOrder.remove(at: index)
        }
    }
}
