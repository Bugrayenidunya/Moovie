//
//  SearchByTitleRequestModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

class SearchByTitleRequestModel: RequestModel {
    
    // MARK: Properties
    
    private let title: String
    
    // MARK: Inits
    
    init(title: String) {
        self.title = title
        
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
            "s": self.title
        ]
    }
    
}
