//
//  CheckoutViewCordinatorProtocol.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 25/08/21.
//

import Foundation
import SwiftUI

public protocol CheckoutViewCordinatorProtocol{
    func showAlert(totalPrice: String)->Alert
}
