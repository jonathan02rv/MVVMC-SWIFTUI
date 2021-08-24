//
//  MenuViewUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol MenuViewUseCaseProtocol {
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void)
}

public struct MenuViewUseCase: MenuViewUseCaseProtocol {
    
    let useCase: MenuOrderUseCaseProtocol
    
    public init(useCase: MenuOrderUseCaseProtocol) {
        self.useCase = useCase
    }
    
    public func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void){
        self.useCase.getMenuSectionsService(completion)
    }
    
    
}
