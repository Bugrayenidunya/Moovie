//
//  Rating.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

struct Rating: Codable {
    
    // MARK: Properties
    
    var source, value: String?
    
    // MARK: CodingKeyss
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
}
