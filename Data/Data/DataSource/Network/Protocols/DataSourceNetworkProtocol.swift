//
//  DataSourceNetworkProtocol.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation


public protocol DataSourceNetworkProtocol{
    func getMenuSectionsService(request: RequestObject, _ completion:@escaping (Swift.Result<[MenuSectionEntity],ErrorEntity>)->Void)
    func confirmOrder(request: RequestObject,_ completion: @escaping (Swift.Result<Void, ErrorEntity>) -> Void)
}
