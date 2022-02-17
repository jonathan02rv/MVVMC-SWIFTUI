//
//  ItemModel.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 29/01/22.
//

import Foundation
import Domain

public struct ItemModel: Equatable, Identifiable {
    public var id: String
    public var name: String
    public var photoCredit: String
    public var price: Int
    public var description: String
    
    public var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    public var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    public init(id: String, name: String, photoCredit: String, price: Int, description: String){
        self.id = id
        self.name = name
        self.photoCredit = photoCredit
        self.price = price
        self.description = description
    }
    
    public static let emptyItem = ItemModel(id: "", name: "", photoCredit: "", price: 0, description: "")

    #if DEBUG
    public static let example = MenuItemModel(id: UUID().uuidString, name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}

extension ItemModel {
    public static func mapArray(itemsData: [MenuItemModel])->[ItemModel]{
        itemsData.map {
            ItemModel(id: $0.id, name: $0.name, photoCredit: $0.photoCredit, price: $0.price, description: $0.description)
        }
    }
    
    public static func mapperModel(item: ItemModel)->MenuItemModel{
        MenuItemModel(id: item.id, name: item.name, photoCredit: item.photoCredit, price: item.price, description: item.description)
    }
}
