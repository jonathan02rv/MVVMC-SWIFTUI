//
//  DataSourceNetworkProtocol.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation


protocol DataSourceNetworkProtocol{
    func getMenuSectionsService(request: RequestObject, _ completion:@escaping (Swift.Result<[MenuSectionEntity],ErrorEntity>)->Void)
}
