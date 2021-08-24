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
}

struct MainCordinator: MainCordinatorProtocol{
    func getMenuView()-> MenuView<MenuViewModel> {
        let repository = MenuOrderRepository()
        let userCase = MenuViewUseCase(useCase: MenuOrderUseCase(repository: repository))
        let viewModel = MenuViewModel(userCaseMenu: userCase)
        return MenuView(viewModel: viewModel, cordinator: MenuViewCordinator())
    }
}
