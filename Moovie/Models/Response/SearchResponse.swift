//
//  SearchResponse.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

// MARK: - SearchResponse

struct SearchResponse: Codable {
    
    // MARK: Properties
    
    var search: [Search]?
    var totalResults, response: String?

    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
    
}


