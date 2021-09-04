//
//  MenuSectionEntity.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

struct MenuSectionEntity: Codable{
    var id: String
    var name: String
    var items: [MenuItemEntity]
}

extension MenuSectionEntity{
    static func maperArray(data: [MenuSectionEntity])-> [MenuSectionModel]{
        data.map {
            MenuSectionModel(id: $0.id, name: $0.name, items: MenuItemEntity.mapperArray(data: $0.items))
        }
    }
}
