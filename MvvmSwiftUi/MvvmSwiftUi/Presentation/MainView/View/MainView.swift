//
//  MainView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI
import Domain
import Data

struct MainView: View {

    let cordinator: MainCordinatorProtocol
    
    @ViewBuilder var body: some View {
        TabView {
            cordinator.getMenuView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            cordinator.getOrderView()
                .tabItem {
                    Text("Order")
                    Image(systemName: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(cordinator: MainCordinator())
            //.environmentObject(OrderManager.instance)
    }
}
