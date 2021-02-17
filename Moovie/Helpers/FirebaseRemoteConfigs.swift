//
//  FirebaseRemoteConfigs.swift
//  Moovie
//
//  Created by Bugra's Mac on 17.02.2021.
//

import FirebaseRemoteConfig

class FirebaseRemoteConfigs {
    
    // MARK: Properties
    
    static let sharedInstance = FirebaseRemoteConfigs()
    
    // MARK: Init
    
    private init() {
        loadDefaultValues()
        fetchCloudValues()
    }
    
    // MARK: Functions
    
    func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            ValueKey.splashScreenGreetingText.rawValue : "Loodos"
        ]
        
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
    }
    
    func activateDebugMode() {
        let settings = RemoteConfigSettings()
        // WARNING: Don't actually do this in production, it is for test purpose!
        settings.minimumFetchInterval = 0
        RemoteConfig.remoteConfig().configSettings = settings
    }
    
    func fetchCloudValues() {
        activateDebugMode()
        
        RemoteConfig.remoteConfig().fetch { _, error in
            
            if let error = error {
                print("An error occured while fetching remote values \(error)")
                return
            }
            
            RemoteConfig.remoteConfig().activate { _, _ in
                let splashScreenGreetingText = RemoteConfig.remoteConfig()
                    .configValue(forKey: "splashScreenGreetingText")
                    .stringValue
                
                print("Greeting text is \(String(describing: splashScreenGreetingText))")
            }
        }
    }
    
    func text(forKey key: ValueKey) -> String {
        let text = RemoteConfig.remoteConfig()[key.rawValue]
            .stringValue ?? "undefined"
        return text
    }
    
}

// MARK: - Enum: ValueKey

enum ValueKey: String {
    case splashScreenGreetingText
}
