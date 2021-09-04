//
//  MockCheckoutViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation


class MockCheckoutViewModel: CheckoutViewModelProtocol{
    func confirmOrder() {
        
    }
    
    var loyaltyNumber: String = ""
    
    var addLoyaltyDetails: Bool = false
    
    var showingPaymentAlert: Bool = false
    
    var paymentType: String = ""
    
    var tipAmount: Int = 0
    
    
    var paymentTypes: [String] = []
    
    var tipAmounts: [Int] = []
    
    var totalPrice: String = ""
    
    
}
