//
//  ItemModel.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 29/01/22.
//

import Foundation
import Domain

struct ItemModel: Equatable, Identifiable {
    var id: String
    var name: String
    var photoCredit: String
    var price: Int
    var description: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    init(id: String, name: String, photoCredit: String, price: Int, description: String){
        self.id = id
        self.name = name
        self.photoCredit = photoCredit
        self.price = price
        self.description = description
    }
    
    static let emptyItem = ItemModel(id: "", name: "", photoCredit: "", price: 0, description: "")

    #if DEBUG
    static let example = MenuItemModel(id: UUID().uuidString, name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}

extension ItemModel {
    static func mapArray(itemsData: [MenuItemModel])->[ItemModel]{
        itemsData.map {
            ItemModel(id: $0.id, name: $0.name, photoCredit: $0.photoCredit, price: $0.price, description: $0.description)
        }
    }
    
    static func mapperModel(item: ItemModel)->MenuItemModel{
        MenuItemModel(id: item.id, name: item.name, photoCredit: item.photoCredit, price: item.price, description: item.description)
    }
}
