//
//  MainCordinatorProtocol.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation

public protocol MainCordinatorProtocol{
    func getMenuView()-> MenuView<MenuViewModel>
    func getOrderView()-> OrderView<OrderViewModel>
}
