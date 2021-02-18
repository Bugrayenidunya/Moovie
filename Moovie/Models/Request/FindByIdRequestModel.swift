//
//  FindByIdRequestModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

class FindByIdRequestModel: RequestModel {
    
    // MARK: Properties
    
    private let id: String
    
    // MARK: Inits
    
    init(id: String) {
        self.id = id
        
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    // MARK: Path
    
    override var path: String {
        return "\(Constant.EndpointConstants.baseURL)?apikey=\(Constant.EndpointConstants.apiKey)"
    }
    
    // MARK: Method
    
    override var method: HTTPMethod {
        return HTTPMethod.post
    }
    
    // MARK: Parameters
    
    override var parameters: [String : Any?] {
        return [
            "i": self.id
        ]
    }
}
