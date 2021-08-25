//
//  OrderViewCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

protocol OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView
}

struct OrderViewCordinator: OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView{
        return CheckoutView()
    }
}
