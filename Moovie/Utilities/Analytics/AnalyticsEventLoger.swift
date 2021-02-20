//
//  AnalyticsEventLoger.swift
//  Moovie
//
//  Created by Bugra's Mac on 20.02.2021.
//

import Firebase

final class AnalyticsEventLoger {
    
    class func logMovieDetail(movie: Movie) {
        Analytics.logEvent(Constant.AnalyticsConstants.logMovieDetailEvent, parameters: movie.movieToAnalytics)
    }
    
}
