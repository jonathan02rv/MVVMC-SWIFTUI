//
//  CheckoutView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI

struct CheckoutView<ViewModel>: View where ViewModel: CheckoutViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    let cordinator: CheckoutViewCordinatorProtocol
    
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Pay Method")) {
                
                Picker("How do you want to pay?", selection: $viewModel.paymentType) {
                    ForEach(viewModel.paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add Loyalty Card", isOn: $viewModel.addLoyaltyDetails.animation())
                if viewModel.addLoyaltyDetails{
                    TextField("Enter your Loyalty Card Number",text: $viewModel.loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $viewModel.tipAmount) {
                    
                    ForEach(viewModel.tipAmounts, id: \.self) {
                        return Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: \(viewModel.totalPrice)")
                        .font(.title))
            {
                Button("Confirm Order") {
                    self.viewModel.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .alert(isPresented: $viewModel.showingPaymentAlert, content: {
            cordinator.showAlert(totalPrice: viewModel.totalPrice)
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
        CheckoutView(viewModel: MockCheckoutViewModel(), cordinator: CheckoutViewCordinator())
    }
}
