//
//  MenuModel.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 29/01/22.
//

import Foundation
import Domain

struct MenuModel: ViewData, Identifiable {
    public var id: String
    public var name: String
    public var items = [ItemModel]()
    
    public init(id: String, name: String, items: [ItemModel]){
        self.id = id
        self.name = name
        self.items = items
    }
}

extension MenuModel{
    static func maperArray(menuData: [MenuSectionModel])->[MenuModel]{
        menuData.map {
            MenuModel(id: $0.id, name: $0.name, items: ItemModel.mapArray(itemsData: $0.items))
        }
    }
}
