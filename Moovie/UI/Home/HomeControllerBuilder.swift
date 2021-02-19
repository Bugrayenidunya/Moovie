//
//  HomeControllerBuilder.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

final class HomeControllerBuilder {
    
    func build() -> HomeController {
        let vc = HomeController()
        vc.viewModel = HomeViewModel(services: Services())
        return vc
    }
    
}
