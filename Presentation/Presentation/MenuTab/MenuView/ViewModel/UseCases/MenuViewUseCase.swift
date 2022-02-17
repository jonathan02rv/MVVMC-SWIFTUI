//
//  MenuViewUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

public protocol MenuViewUseCaseProtocol {
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuModel],ErrorModel>)->Void)
}

public struct MenuViewUseCase: MenuViewUseCaseProtocol {
    
    let useCase: MenuOrderUseCaseProtocol
    
    public init(useCase: MenuOrderUseCaseProtocol) {
        self.useCase = useCase
    }
    
    public func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuModel],ErrorModel>)->Void){
        
        useCase.getMenuSectionsService { (result) in
            switch result {
            case .success(let data):
                completion(.success(MenuModel.maperArray(menuData: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
