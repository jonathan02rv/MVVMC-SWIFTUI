//
//  CheckoutView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI

struct CheckoutView<ViewModel>: View where ViewModel: CheckoutViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    //let cordinator: OrderViewCordinatorProtocol
    
    
    @EnvironmentObject var order: OrderManager
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    @State private var paymentType = "Credit Card"
    
    @State private var tipAmount = 15
    
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Pay Method")) {
                
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(viewModel.paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add Loyalty Card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails{
                    TextField("Enter your Loyalty Card Number",text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(viewModel.tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: \(viewModel.totalPrice)")
                        .font(.title))
            {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert, content: {
            return Alert(title: Text("Order Confirmed"), message: Text("Your total was \(viewModel.totalPrice)"), dismissButton: .default(Text("OK")))
        })
        .onAppear {
            print("CheckoutView appeared!")
        }
        .onDisappear {
            print("CheckoutView disappeared!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(viewModel: MockCheckoutViewModel())
    }
}
