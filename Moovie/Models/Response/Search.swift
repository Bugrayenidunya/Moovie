//
//  Search.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

struct Search: Codable {
    
    // MARK: Properties
    
    var title, year, imdbID: String?
    var poster: String?

    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
    
}
