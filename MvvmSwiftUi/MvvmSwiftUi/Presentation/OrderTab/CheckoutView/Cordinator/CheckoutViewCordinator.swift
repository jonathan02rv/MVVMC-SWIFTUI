//
//  CheckoutViewCordinator.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import SwiftUI

protocol CheckoutViewCordinatorProtocol{
    func showAlert(totalPrice: String)->Alert
}

struct CheckoutViewCordinator: CheckoutViewCordinatorProtocol{
    func showAlert(totalPrice: String)-> Alert{
        Alert(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
    }
}
