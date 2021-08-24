//
//  OrderView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Order List")) {
                    ForEach(order.itemsOrder) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    //.onDelete(perform: self.deleteItems)
                    .onDelete { self.deleteItems(at :$0) }
                    //.onMove { self.moveItems(from: $0, to: $1) }
                }
                
                Section {
                    NavigationLink(destination:
                        CheckoutView()) {
                        Text("Place Order")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }.disabled(self.order.itemsOrder.isEmpty)
            }
            .navigationBarTitle("Order", displayMode: .large)
            .navigationBarItems(trailing:
                                    EditButton()
                                    .disabled(self.order.itemsOrder.isEmpty))
            .listStyle(GroupedListStyle())
        }
        .onAppear {
            print("OrderView appeared!")
        }
        .onDisappear {
            print("OrderView disappeared!")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.itemsOrder.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
