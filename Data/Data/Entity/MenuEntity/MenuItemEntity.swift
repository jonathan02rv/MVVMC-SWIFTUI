//
//  MenuItemEntity.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

struct MenuItemEntity:Codable{
    var id: String
    var name: String?
    var photoCredit: String?
    var price: Int?
    var restrictions: [String]?
    var description: String?
}

extension MenuItemEntity{
    static func mapperArray(data: [MenuItemEntity])->[MenuItemModel]{
        data.map {
            MenuItemModel(id: $0.id, name: $0.name ?? "", photoCredit: $0.photoCredit ?? "", price: $0.price ?? 0, description: $0.description ?? "")
        }
    }
}
