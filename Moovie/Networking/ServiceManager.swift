//
//  ServiceManager.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Alamofire

class ServiceManager {
    
    // MARK: Properties
    
    static let sharedInstance = ServiceManager()
    
    // MARK: Functions
    
    func sendRequest<T:Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, AFError>)-> Void) {
        
        AF.request(request.urlRequest()).validate().responseJSON { response in
            
            guard let data = response.data else {
                if let error = response.error {
                    completion(Result.failure(error))
                }
                
                return
            }
            
            
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                return
            }
            
            completion(Result.success(decodedResponse))
            
        }
    }
    
}
