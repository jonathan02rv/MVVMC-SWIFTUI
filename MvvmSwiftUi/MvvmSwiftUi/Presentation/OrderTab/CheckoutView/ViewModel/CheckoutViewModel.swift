//
//  CheckoutViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

protocol CheckoutViewModelProtocol: ObservableObject{
    var totalPrice: String { get }
    var tipAmounts: [Int] { get }
    var paymentTypes: [String] { get }
}

class CheckoutViewModel: CheckoutViewModelProtocol{
    
    @Published var itemsOrder = [MenuItemModel]()
 
    private var globalOrder: OrderProtocol
    
    init() {
        self.globalOrder = OrderAdapter()
    }

    var totalPrice: String {
        let total = Double(globalOrder.getTotal())
        let tipValue = total / 100 * Double(tipAmount)
        return "$ \(total + tipValue)"
    }

    @Published var addLoyaltyDetails = false
    @Published var loyaltyNumber = ""
    @Published var showingPaymentAlert = false
    
    @Published var paymentType = "Credit Card"
    let paymentTypes = ["Cash", "Credit Card", "Dinner Points"]
    
    @Published var tipAmount = 15
    let tipAmounts = [10, 15, 20, 25, 0]
    
    
}
