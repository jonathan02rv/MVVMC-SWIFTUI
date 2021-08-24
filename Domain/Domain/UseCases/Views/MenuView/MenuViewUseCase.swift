//
//  MenuViewUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

protocol MenuViewUseCaseProtocol {
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<MenuSectionModel,ErrorModel>)->Void)
}

struct MenuViewUseCase: MenuViewUseCaseProtocol {
    
    let useCase: MenuOrderUseCaseProtocol
    
    init(useCase: MenuOrderUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<MenuSectionModel,ErrorModel>)->Void){
        self.useCase.getMenuSectionsService(completion)
    }
    
    
}
