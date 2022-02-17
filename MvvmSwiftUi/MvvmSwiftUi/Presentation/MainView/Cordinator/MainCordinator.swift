//
//  MainCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
import Data
import Domain

protocol MainCordinatorProtocol{
    func getMenuView()-> MenuView<MenuViewModel>
    func getOrderView()-> OrderView<OrderViewModel>
}

struct MainCordinator: MainCordinatorProtocol{
    func getMenuView()-> MenuView<MenuViewModel> {
        let repository = MenuOrderRepository(networkSource: DataSourceNetwork(), localSource: DataSourceLocal())
        let userCase = MenuViewUseCase(useCase: MenuOrderUseCase(repository: repository))
        let viewModel = MenuViewModel(userCaseMenu: userCase)
        return MenuView(viewModel: viewModel, cordinator: MenuViewCordinator())
    }
    
    func getOrderView()-> OrderView<OrderViewModel>{
        return OrderView(viewModel: OrderViewModel(), cordinator: OrderViewCordinator())
    }
}
