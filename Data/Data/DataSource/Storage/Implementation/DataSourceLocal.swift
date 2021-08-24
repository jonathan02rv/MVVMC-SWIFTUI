//
//  DataSourceLocal.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

struct DataSourceLocal:DataSourceLocalProtocol {
    func getMenuSectionsService(_ completion: @escaping (Result<[MenuSectionEntity], ErrorEntity>) -> Void) {
        guard let dataJson = Bundle.main.decode([MenuSectionEntity].self, from: "menu.json") else{
            completion(.failure(ErrorHandler.get(type: .mapperError, description: nil)))
            return
        }
        completion(.success(dataJson))
    }
}
