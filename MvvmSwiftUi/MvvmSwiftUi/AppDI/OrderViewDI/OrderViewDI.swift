//
//  OrderViewDI.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 17/02/22.
//

import Foundation
import Presentation
import Domain
import Data

struct OrderViewDI: OrderViewCordinatorProtocol {
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>{
        
        let repository = MenuOrderRepository()
        let userCase = CheckoutViewUseCase(useCase: MenuOrderUseCase(repository: repository))
        let viewModel = CheckoutViewModel(useCaseCheckout: userCase)
        
        return CheckoutView(viewModel: viewModel, cordinator: CheckoutViewDI())
    }
}
