//
//  DataSourceLocal.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public struct DataSourceLocal:DataSourceLocalProtocol {
    
    public init() {}
    
    public func getMenuSectionsService(fileName:String, _ completion: @escaping (Result<[MenuSectionEntity], ErrorEntity>) -> Void) {
        guard let dataJson = Bundle.main.decode([MenuSectionEntity].self, from: fileName) else{
            completion(.failure(ErrorHandler.get(type: .mapperError, description: nil)))
            return
        }
        completion(.success(dataJson))
    }
}
