//
//  MainView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 17/08/21.
//

import SwiftUI
import Domain

public struct MainView: View {
    
    var cordinator : MainCordinatorProtocol
    
    public init(cordinator : MainCordinatorProtocol) {
        self.cordinator = cordinator
    }
    
    @ViewBuilder public var body: some View {
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
/*
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(appDI: <#MainViewDIProtocol#>, cordinator: MainCordinator())
    }
}*/
