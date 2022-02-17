//
//  MenuCordinatorProtocol.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation

public protocol MenuViewCordinatorProtocol{
    func routeToDetailItem(itemMenu: ItemModel)->ItemDetail<ItemDetailViewModel>
}
