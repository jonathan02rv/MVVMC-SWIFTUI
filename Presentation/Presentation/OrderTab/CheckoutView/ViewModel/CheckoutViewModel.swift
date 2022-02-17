//
//  CheckoutViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import Domain

public protocol CheckoutViewModelProtocol: ObservableObject{
    var totalPrice: String { get }
    var tipAmount: Int {get set}
    var tipAmounts: [Int] { get }
    var paymentTypes: [String] { get }
    var paymentType: String {get set}
    var loyaltyNumber: String {get set}
    var addLoyaltyDetails:Bool {get set}
    var showingPaymentAlert:Bool {get set}
    func confirmOrder()
}

public class CheckoutViewModel: CheckoutViewModelProtocol{
    public var totalPrice: String {
        print("TOTAL: \(globalOrder.getTotal())")
        let total = Double(globalOrder.getTotal())
        let tipValue = total / 100 * Double(tipAmount)
        return "$ \(total + tipValue)"
    }

    @Published public var addLoyaltyDetails = false
    @Published public var loyaltyNumber = ""
    @Published public var showingPaymentAlert = false
    
    @Published public var paymentType = "Credit Card"
    public let paymentTypes = ["Cash", "Credit Card", "Dinner Points"]
    
    
    @Published public var tipAmount = 15
    public let tipAmounts = [10, 15, 20, 25, 0]
    
    
    @Published var itemsOrder = [ItemModel]()
 
    var globalOrder: OrderProtocol

    var useCaseCheckout: CheckoutViewUseCaseProtocol
    public init(useCaseCheckout: CheckoutViewUseCaseProtocol) {
        self.globalOrder = OrderAdapter()
        self.useCaseCheckout = useCaseCheckout
    }
    
    
    public func confirmOrder(){
        useCaseCheckout.confirmOrder(totalAmount: self.totalPrice) { (result) in
            switch result {
            case .success():
                print("SUCCESS PAYMENT")
            case .failure(let error):
                print(error)
            }
        }
    }

}
