//
//  RequestModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

class RequestModel: NSObject, Codable {
    
    // MARK: Properties
    
    /// Request endpoint's path
    var path: String {
        return ""
    }
    
    /// Request parameters
    var parameters: [String: Any?] {
        return [:]
    }
    
    /// Request method
    var method: HTTPMethod {
        return .get
    }
    
    /// Header
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    
}

// MARK: - Extension

extension RequestModel {
    
    func urlRequest() -> URLRequest {
        var endpoint: String = path
        
        for parameter in parameters {
            if let value = parameter.value as? String {
                endpoint.append("&\(parameter.key)=\(value)")
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
        
        request.httpMethod = method.rawValue
        
        return request
    }
    
}

// MARK: - Enum: HTTPMethod

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
