//
//  HomeControllerBuilder.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

final class HomeControllerBuilder {
    
    func build(viewModel: HomeViewModel) -> HomeController {
        let vc = HomeController(viewModel: viewModel)
        return vc
    }
    
}
