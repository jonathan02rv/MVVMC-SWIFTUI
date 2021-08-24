//
//  MenuOrderUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol MenuOrderUseCaseProtocol{
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void)
}

public struct MenuOrderUseCase: MenuOrderUseCaseProtocol{
    var repository: MenuOrderRepositoryProtocol
    
    public init(repository: MenuOrderRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void){
        repository.getMenuSectionsService(completion)
    }
}
