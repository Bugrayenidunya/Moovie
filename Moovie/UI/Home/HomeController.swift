//
//  HomeController.swift
//  Moovie
//
//  Created by Bugra's Mac on 17.02.2021.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: Properties
    
    
    // MARK: Views
    
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inits
        configureUI()
    }
    
    // MARK: Actions
    
    
    // MARK: Functions
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

