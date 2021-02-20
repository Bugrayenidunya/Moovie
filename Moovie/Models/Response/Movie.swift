//
//  Movie.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Foundation

struct Movie: Codable {
    
    // MARK: Properties
    
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards: String?
    var poster: String?
    var metascore, imdbRating, imdbVotes, imdbID: String?
    var type, dvd, boxOffice, production: String?
    var website, response: String?
    
    // MARK: CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
}

// MARK: - Analytics

extension Movie {
    
    enum Analytics: String {
        case title
        case imdbRating
        case reviewCount
        case released
        case director
        case null
    }
    
    var movieToAnalytics: [String : Any] {
        return [
            Analytics.title.rawValue: self.title ?? Analytics.null.rawValue,
            Analytics.imdbRating.rawValue: self.imdbRating ?? Analytics.null.rawValue,
            Analytics.reviewCount.rawValue: self.imdbVotes ?? Analytics.null.rawValue,
            Analytics.released.rawValue: self.released ?? Analytics.null.rawValue,
            Analytics.director.rawValue: self.released ?? Analytics.null.rawValue
        ]
    }
    
}
