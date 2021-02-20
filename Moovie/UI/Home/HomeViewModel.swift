//
//  HomeViewModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

class HomeViewModel {
    
    // MARK: Properties
    
    private var services: Services?
    private var movies: [Search]?
    
    // MARK: Init
    
    init(services: Services) {
        self.services = services
    }
    
    // MARK: Functions
    
    func fetchMoviesBySearchTerm(term: String, completion: @escaping(() -> Void )) {
        Services.searchMovieByTitle(title: term) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                case .failure(let error):
                    print(error, #line, #file)
                case .success(let response):
                    if response.totalResults != nil {
                        self.movies = response.search
                        completion()
                    } else {
                        self.movies = []
                        completion()
                    }
            }
        }
    }
    
    func returnSearchResult() -> [Search]? {
        return self.movies
    }
    
}
