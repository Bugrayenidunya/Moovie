//
//  DetailControllerBuilder.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

final class DetailControllerBuilder {
    
    func build() -> DetailController {
        let vc = DetailController()
        vc.viewModel = DetailViewModel()
        return vc
    }
    
}
