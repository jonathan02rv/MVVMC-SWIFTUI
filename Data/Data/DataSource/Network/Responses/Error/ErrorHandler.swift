//
//  ErrorHandler.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

enum ErrorService:Error{
    case networkError(description:String)
    case custom(description:String)
}
