//
//  CheckoutOrderRequest.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 26/08/21.
//

import Foundation

internal struct RequestOBjectCheckoukOrder: RequestObject{
    var path: String = "tokenTest"
    var method: HTTPMethod = .post
    var headers: HTTPHeaders
    var parameters: Parameters = [:]
    
    init(params:Parameters ) {
        headers = headerDefault
        parameters = params
    }
}
