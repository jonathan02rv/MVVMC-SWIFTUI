//
//  MainViewDI.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 17/02/22.
//

import Foundation
import Presentation
import Domain
import Data

struct MainViewDI: MainCordinatorProtocol {
    
    static func getMainView() -> MainView {
        MainView(cordinator: MainViewDI())
    }
    
    func getMenuView()-> MenuView<MenuViewModel> {
        let repository = MenuOrderRepository(networkSource: DataSourceNetwork(), localSource: DataSourceLocal())
        let userCase = MenuViewUseCase(useCase: MenuOrderUseCase(repository: repository))
        let viewModel = MenuViewModel(userCaseMenu: userCase)
        return MenuView(viewModel: viewModel, cordinator: MenuViewDI())
    }
    
    public func getOrderView()-> OrderView<OrderViewModel>{
        return OrderView(viewModel: OrderViewModel(), cordinator: OrderViewDI())
    }
}
