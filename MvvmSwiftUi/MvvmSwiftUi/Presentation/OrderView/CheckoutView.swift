//
//  CheckoutView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    @State private var paymentType = "Credit Card"
    let paymentTypes = ["Cash", "Credit Card", "Dinner Points"]
    
    @State private var tipAmount = 15
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        //let formatter = NumberFormatter()
        //formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
       //return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        return "$ \(total + tipValue)"
    }
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Pay Method")) {
                
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
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
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.title))
            {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert, content: {
            return Alert(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
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
        CheckoutView()
            .environmentObject(Order.instance)
    }
}
