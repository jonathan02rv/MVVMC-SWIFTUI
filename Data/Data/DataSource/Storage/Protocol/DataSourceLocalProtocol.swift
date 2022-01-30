//
//  DataSourceLocalProtocol.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol DataSourceLocalProtocol{
    func getMenuSectionsService(fileName:String,_ completion:@escaping (Swift.Result<[MenuSectionEntity],ErrorEntity>)->Void)
}
