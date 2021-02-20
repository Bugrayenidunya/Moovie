//
//  SplashScreenBuilder.swift
//  Moovie
//
//  Created by Bugra's Mac on 20.02.2021.
//

import Foundation

final class SplashScreenBuilder {
    
    func build(viewModel: SplashScreenViewModel) -> SplashScreenController {
        let vc = SplashScreenController(viewModel: viewModel)
        return vc
    }
    
}
