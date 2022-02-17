//
//  CheckoutViewDI.swift
//  MvvmSwiftUi
//
//  Created by JHONATAHAN RIVERA on 17/02/22.
//

import Foundation
import SwiftUI
import Presentation
import Domain
import Data

struct CheckoutViewDI: CheckoutViewCordinatorProtocol{
    func showAlert(totalPrice: String)-> Alert{
        Alert(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
    }
}
