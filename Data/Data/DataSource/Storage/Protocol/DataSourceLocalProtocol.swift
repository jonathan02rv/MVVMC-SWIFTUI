//
//  DataSourceLocalProtocol.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

protocol DataSourceLocalProtocol{
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionEntity],ErrorEntity>)->Void)
}
