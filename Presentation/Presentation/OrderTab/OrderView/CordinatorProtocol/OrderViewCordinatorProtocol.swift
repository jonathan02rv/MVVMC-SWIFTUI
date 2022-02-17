//
//  OrderViewCordinatorProtocol.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation

public protocol OrderViewCordinatorProtocol{
    func routeToCheckoutView()->CheckoutView<CheckoutViewModel>
}
