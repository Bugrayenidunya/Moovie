//
//  AppConstants.swift
//  Moovie
//
//  Created by Bugra's Mac on 17.02.2021.
//

import Foundation

extension Constant {
    
    class AppConstants {
        
        static let splashScreenGreetingText = FirebaseRemoteConfigs
            .sharedInstance
            .text(forKey: .splashScreenGreetingText)
        
    }
    
}
