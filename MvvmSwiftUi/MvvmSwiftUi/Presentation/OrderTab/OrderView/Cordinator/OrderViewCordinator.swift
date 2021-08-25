//
//  OrderViewCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

protocol OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>
}

struct OrderViewCordinator: OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>{
        return CheckoutView(viewModel: CheckoutViewModel())
    }
}
