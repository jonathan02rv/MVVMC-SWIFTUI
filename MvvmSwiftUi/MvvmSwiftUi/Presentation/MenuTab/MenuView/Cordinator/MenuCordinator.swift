//
//  MenuCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
//import Domain

protocol MenuViewCordinatorProtocol{
    func routeToDetailItem(itemMenu: ItemModel)->ItemDetail<ItemDetailViewModel>
}

struct MenuViewCordinator: MenuViewCordinatorProtocol{
    func routeToDetailItem(itemMenu: ItemModel) -> ItemDetail<ItemDetailViewModel> {
        let viewModel = ItemDetailViewModel(itemMenu: itemMenu)
        return ItemDetail(viewModel: viewModel)
    }
    
   
}
