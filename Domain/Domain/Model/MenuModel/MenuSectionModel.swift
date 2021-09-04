//
//  MenuSectionModel.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public struct MenuSectionModel: Identifiable {
    public var id: String
    public var name: String
    public var items = [MenuItemModel]()
    
    public init(id: String, name: String, items: [MenuItemModel]){
        self.id = id
        self.name = name
        self.items = items
    }
}
