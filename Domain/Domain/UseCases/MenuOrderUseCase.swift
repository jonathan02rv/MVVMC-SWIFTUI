//
//  MenuOrderUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol MenuOrderUseCaseProtocol{
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void)
    func confirmOrder(totalAmount: String,_ completion: @escaping (Swift.Result<Void,ErrorModel>)->Void)
}

public struct MenuOrderUseCase: MenuOrderUseCaseProtocol{
    var repository: MenuOrderRepositoryProtocol
    
    public init(repository: MenuOrderRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void){
        repository.getMenuSectionsService(completion)
    }
    
    public func confirmOrder(totalAmount: String,_ completion: @escaping (Swift.Result<Void,ErrorModel>)->Void) {
        repository.confirmOrder(totalAmount: totalAmount, completion)
    }
    
}
