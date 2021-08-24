//
//  MenuOrderRepositoryProtocol.swift
//  Domain
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol MenuOrderRepositoryProtocol{
    func getMenuSectionsService(_ completion:@escaping (Swift.Result<[MenuSectionModel],ErrorModel>)->Void)
}
