//
//  SplashScreenController.swift
//  Moovie
//
//  Created by Bugra's Mac on 17.02.2021.
//

import Network
import UIKit
import SnapKit

class SplashScreenController: UIViewController {
    
    // MARK: Properties
    
    private var viewModel: SplashScreenViewModel!
    
    private var splashGreetingLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.AppConstants.splashScreenGreetingText
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkConnectionDidSatisfied()
        configureUI()
    }
    
    init(viewModel: SplashScreenViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Privates

private extension SplashScreenController {
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(splashGreetingLabel)
        
        splashGreetingLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
    
    func networkConnectionDidSatisfied() {
        viewModel.networkConnectionDidSatisfied { [weak self] satisfied in
            guard let self = self else { return }
            
            if satisfied {
                self.splashGreetingLabel.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    let vc = HomeControllerBuilder().build(viewModel: HomeViewModel())
                    self.view.window?.rootViewController = UINavigationController(rootViewController: vc)
                    self.view.window?.makeKeyAndVisible()
                }
                
                return
            }
            let alert = UIAlertController(title: "Warning", message: "Please check your internet connection.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
