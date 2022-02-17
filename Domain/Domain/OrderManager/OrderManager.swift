//
//  OrderManager.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import SwiftUI

public protocol OrderProtocolAUX {
    func add(item: MenuItemModel)
    func remove(item: MenuItemModel)
    func getItemsOrder()->[MenuItemModel]
    func deleteItems(at offsets: IndexSet)
    func getTotal()->Int
}

public class OrderManager: ObservableObject {

    public static var instance = OrderManager()
    private init(){}
    
    @Published public var itemsOrder = [MenuItemModel]()

    public var total: Int {
        if itemsOrder.count > 0 {
            return itemsOrder.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    public func getTotal()->Int{
        total
    }

    public func add(item: MenuItemModel) {
        itemsOrder.append(item)
    }

    public func remove(item: MenuItemModel) {
        if let index = itemsOrder.firstIndex(of: item) {
            itemsOrder.remove(at: index)
        }
    }
    
    public func deleteItems(at offsets: IndexSet) {
        itemsOrder.remove(atOffsets: offsets)
    }
    
    public func getItemsOrder() -> [MenuItemModel] {
        itemsOrder
    }
}
