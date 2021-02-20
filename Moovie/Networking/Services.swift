//
//  Services.swift
//  Moovie
//
//  Created by Bugra's Mac on 18.02.2021.
//

import Alamofire
import Foundation

public class Services {
    
    typealias completionHandler<T> = Swift.Result<T, AFError>
    
    class func findMovieById(id: String, completion: @escaping(completionHandler<Movie>) -> Void) {
        ServiceManager.sharedInstance.sendRequest(request: FindByIdRequestModel(id: id)) { (result) in
            completion(result)
        }
    }
    
    class func searchMovieByTitle(title: String, completion: @escaping(completionHandler<SearchResponse>) -> Void) {
        ServiceManager.sharedInstance.sendRequest(request: SearchByTitleRequestModel(title: title)) { (result) in
            completion(result)
        }
    }
    
}
