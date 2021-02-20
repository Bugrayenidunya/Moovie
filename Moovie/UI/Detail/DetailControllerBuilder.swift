//
//  DetailControllerBuilder.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Foundation

final class DetailControllerBuilder {
    
    func build(viewModel: DetailViewModel) -> DetailController {
        let vc = DetailController(viewModel: viewModel)
        return vc
    }
    
}
