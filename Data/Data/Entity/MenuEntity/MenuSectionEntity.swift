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
    static func maper(data: MenuSectionEntity)-> MenuSectionModel{
        return MenuSectionModel(id: data.id, name: data.name, items: MenuItemEntity.mapperArray(data: data.items))
    }
}
