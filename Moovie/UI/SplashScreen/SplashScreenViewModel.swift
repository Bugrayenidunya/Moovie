//
//  SplashScreenViewModel.swift
//  Moovie
//
//  Created by Bugra's Mac on 20.02.2021.
//

import Network

class SplashScreenViewModel {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.main
    
    func networkConnectionDidSatisfied(completion: @escaping((Bool)->Void)) {
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completion(true)
                return
            }
            
            completion(false)
        }
    }
    
}
