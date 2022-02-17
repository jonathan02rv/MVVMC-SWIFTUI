//
//  MenuViewDI.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 17/02/22.
//

import Foundation
import Presentation

struct MenuViewDI:MenuViewCordinatorProtocol {
    func routeToDetailItem(itemMenu: ItemModel) -> ItemDetail<ItemDetailViewModel> {
        let viewModel = ItemDetailViewModel(itemMenu: itemMenu)
        return ItemDetail(viewModel: viewModel)
    }
}
