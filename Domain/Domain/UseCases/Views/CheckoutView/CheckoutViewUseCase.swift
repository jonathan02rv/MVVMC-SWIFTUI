//
//  CheckoutViewUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 26/08/21.
//

import Foundation

public protocol CheckoutViewUseCaseProtocol {
    func confirmOrder(totalAmount: String,_ completion: @escaping (Swift.Result<Void,ErrorModel>)->Void)
}

public struct CheckoutViewUseCase: CheckoutViewUseCaseProtocol {
    
    let useCase: MenuOrderUseCaseProtocol
    
    public init(useCase: MenuOrderUseCaseProtocol) {
        self.useCase = useCase
    }
    
    public func confirmOrder(totalAmount: String,_ completion: @escaping (Swift.Result<Void,ErrorModel>)->Void) {
        self.useCase.confirmOrder(totalAmount: totalAmount, completion)
    }
}
