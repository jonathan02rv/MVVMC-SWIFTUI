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
    
    public init(id: String, name: String, photoCredit: String, price: Int, description: String){
        self.id = id
        self.name = name
        self.photoCredit = photoCredit
        self.price = price
        self.description = description
    }
}
