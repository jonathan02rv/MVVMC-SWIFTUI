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
    var tipAmount: Int {get set}
    var tipAmounts: [Int] { get }
    var paymentTypes: [String] { get }
    var paymentType: String {get set}
    var loyaltyNumber: String {get set}
    var addLoyaltyDetails:Bool {get set}
    var showingPaymentAlert:Bool {get set}
}

class CheckoutViewModel: CheckoutViewModelProtocol{
    var totalPrice: String {
        print("TOTAL: \(globalOrder.getTotal())")
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
    
    
    @Published var itemsOrder = [MenuItemModel]()
 
    var globalOrder: OrderProtocol
    
    init() {
        self.globalOrder = OrderAdapter()
    }
    
    
    

}
