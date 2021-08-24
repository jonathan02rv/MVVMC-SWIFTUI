//
//  DataSourceNetwork.swift
//  Data
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

struct DataSourceNetwork: DataSourceNetworkProtocol{
    let urlSessionConfiguration = URLSessionConfiguration.default
    let urlSession: URLSession!
    
    init() {
        urlSessionConfiguration.timeoutIntervalForRequest = 15.0
        urlSessionConfiguration.timeoutIntervalForResource = 30.0
        urlSession = URLSession(configuration: self.urlSessionConfiguration)
    }
    
    //MARK: - Get Method
    func getMenuSectionsService(request: RequestObject, _ completion:@escaping (Swift.Result<MenuSectionEntity,ErrorEntity>)->Void){
        
        guard let requestRef = request as? RequestOBjectMenuSection else{return}
        let urlService = baseUrlConfig + requestRef.path
        
        guard let urlRequest = RequestUtil.getUrlRequest(urlService: urlService, request: requestRef) else{return}
        
        urlSession.dataTask(with: urlRequest){ (data, response, error) in
            
            let responseString = String(data: data ?? Data(), encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            debugPrint("RESPONSE: \(responseString ?? "")")
            
            guard error == nil else{
                print("GET ERROR: \(String(describing: error))")
                
                guard let errorResponse = try? JSONDecoder().decode(BaseResponseEntity.self, from: data ?? Data()) else{
                    completion(.failure(ErrorHandler.get(type: .httpError, description: error?.localizedDescription)))
                    return
                }
                completion(.failure(ErrorHandler.get(code: errorResponse.code, description: errorResponse.description)))
                return
            }
            
            guard let dataResponse = try? JSONDecoder().decode(MenuSectionEntity.self, from: data ?? Data()) else{
                print("parse error")
                completion(.failure(ErrorHandler.get(type: .mapperError, description: error?.localizedDescription)))
                return
            }
            print("parse SUCCESS")
            completion(.success(dataResponse))
            
        }.resume()
    }
}
