//
//  MenuOrderUseCase.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

protocol MenuOrderUseCaseProtocol{
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<MenuSectionModel,ErrorModel>)->Void)
}

struct MenuOrderUseCase: MenuOrderUseCaseProtocol{
    var repository: MenuOrderRepositoryProtocol
    
    init(repository: MenuOrderRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<MenuSectionModel,ErrorModel>)->Void){
        repository.getMenuSectionsService(completion)
    }
}
