//
//  OrderView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI
import Domain

public struct OrderView<ViewModel>: View where ViewModel : OrderViewModelPprotocol{
        
    @ObservedObject var viewModel: ViewModel
    let cordinator: OrderViewCordinatorProtocol
    
    public var body: some View {
        NavigationView {
            List {
                Section(header: Text("Order List")) {
                    ForEach(viewModel.getItemsOrder()) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete {
                        viewModel.deleteItems(at: $0)
                    }
                    //.onMove { self.moveItems(from: $0, to: $1) }
                }
                
                Section {
                    NavigationLink(destination:
                                    cordinator.routeToCheckoutView()) {
                        Text("Place Order")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }.disabled(self.viewModel.getItemsOrder().isEmpty)
            }
            .navigationBarTitle("Order", displayMode: .large)
            .navigationBarItems(trailing:
                                    EditButton()
                                    .disabled(self.viewModel.getItemsOrder().isEmpty))
            .listStyle(GroupedListStyle())
        }
        .onAppear {
            print("OrderView appeared!")
            viewModel.updateModel()
        }
        .onDisappear {
            print("OrderView disappeared!")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: MockOrderView(), cordinator: OrderViewCordinator())
    }
}
