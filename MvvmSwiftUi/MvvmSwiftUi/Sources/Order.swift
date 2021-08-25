//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI
import Domain

protocol OrderProtocol:class {
    func add(item: MenuItemModel)
    func remove(item: MenuItemModel)
}

class Order: ObservableObject, OrderProtocol {
    
    static let instance = Order()
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
