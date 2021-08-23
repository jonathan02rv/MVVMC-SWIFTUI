//
//  MenuSectionRequest.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation


internal struct RequestOBjectMenuSection: RequestObject{
    var path: String = "TestBills"
    var method: HTTPMethod = .get
    var headers: HTTPHeaders
    var parameters: Parameters = [:]
    
    init() {
        headers = headerDefault
    }
}
