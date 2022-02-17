//
//  OrderViewCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain
import Data

protocol OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>
}

struct OrderViewCordinator: OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>{
        
        let repository = MenuOrderRepository()
        let userCase = CheckoutViewUseCase(useCase: MenuOrderUseCase(repository: repository))
        let viewModel = CheckoutViewModel(useCaseCheckout: userCase)
        
        return CheckoutView(viewModel: viewModel, cordinator: CheckoutViewCordinator())
    }
}
