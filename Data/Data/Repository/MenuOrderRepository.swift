//
//  MenuOrderRepository.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

public struct MenuOrderRepository: MenuOrderRepositoryProtocol{
    
    private let networkDataSource: DataSourceNetworkProtocol
    private let localDataSource: DataSourceLocalProtocol
    
    public init(){
        self.networkDataSource = DataSourceNetwork()
        self.localDataSource = DataSourceLocal()
    }
    
    public func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void){
        
        /*
        localDataSource.getMenuSectionsService { (result) in
            switch result{
            case .success(let data):
                completion(.success(MenuSectionEntity.maperArray(data: data)))
            case .failure(let error):
                completion(.failure(ErrorEntity.maper(errorData: error)))
            }
        }
        
        return*/
        let request = RequestOBjectMenuSection()
        networkDataSource.getMenuSectionsService(request: request) { (result) in
            switch result{
            case .success(let data):
                completion(.success(MenuSectionEntity.maperArray(data: data)))
            case .failure(let error):
                completion(.failure(ErrorEntity.maper(errorData: error)))
            }
        }
    }
}
