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
      
        let request = RequestOBjectMenuSection()
        networkDataSource.getMenuSectionsService(request: request) { (result) in
            switch result{
            case .success(let data):
                completion(.success(MenuSectionEntity.maperArray(data: data)))
            case .failure(_):
                getLocalData(completion)
            }
        }
    }
    
    func getLocalData(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void){
        
        localDataSource.getMenuSectionsService(fileName: "menu.json") { (result) in
            switch result{
            case .success(let data):
                completion(.success(MenuSectionEntity.maperArray(data: data)))
            case .failure(let error):
                completion(.failure(ErrorEntity.maper(errorData: error)))
            }
        }
    }
    
    public func confirmOrder(totalAmount: String, _ completion: @escaping (Swift.Result<Void, ErrorModel>) -> Void) {
        let params = ["totalAmount":totalAmount]
        let request = RequestOBjectCheckoukOrder(params: params)
        networkDataSource.confirmOrder(request: request) { (result) in
            switch result{
            case .success():
                completion(.success(()))
            case .failure(let error):
                completion(.failure(ErrorEntity.maper(errorData: error)))
            }
        }
    }
}
