//
//  MenuItemModel.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public struct MenuItemModel: Equatable, Identifiable {
    public var id: String
    public var name: String
    public var photoCredit: String
    public var price: Int
    public var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    public init(id: String, name: String, photoCredit: String, price: Int, description: String){
        self.id = id
        self.name = name
        self.photoCredit = photoCredit
        self.price = price
        self.description = description
    }


    #if DEBUG
    static let example = MenuItemModel(id: UUID().uuidString, name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}
