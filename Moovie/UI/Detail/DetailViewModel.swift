//
//  DetailViewModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

class DetailViewModel {
    
    private var movie: Movie?
    
    // MARK: Functions
    
    func findMovieById(id: String, completion: @escaping(() -> Void )) {
        Services.findMovieById(id: id) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                case .failure(let error):
                    print(error.localizedDescription, #file, #line)
                case .success(let response):
                    self.movie = response
                    completion()
            }
        }
    }
    
    func returnFetchedMovie() -> Movie? {
        return self.movie
    }
    
}
