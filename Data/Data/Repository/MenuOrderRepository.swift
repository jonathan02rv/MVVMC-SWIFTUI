//
//  MenuOrderRepository.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

struct MenuOrderRepository{
    private let networkDataSource: DataSourceNetworkProtocol
    private let localDataSource: DataSourceLocalProtocol
    
    init(){
        self.networkDataSource = DataSourceNetwork()
        self.localDataSource = DataSourceLocal()
    }
    
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<MenuSectionModel,ErrorService>)->Void){
        let request = RequestOBjectMenuSection()
        networkDataSource.getMenuSectionsService(request: request) { (result) in
            switch result{
            case .success(let data):
                completion(.success(MenuSectionEntity.maper(data: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
