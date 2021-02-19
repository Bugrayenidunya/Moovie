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
    
    /// Declareted for monitoring to network connection.
    let monitor = NWPathMonitor()
    
    // MARK: Views
    
    private lazy var splashGreetingLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.AppConstants.splashScreenGreetingText
        label.isHidden = true
        return label
    }()
    
    // MARK: Lyfcycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inits
        didNetworkConnectionChanged()
        configureUI()
    }
    
    // MARK: Functions
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(splashGreetingLabel)
        
        splashGreetingLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
    
    func didNetworkConnectionChanged() {
        let queue = DispatchQueue.main
        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else {return}
            
            if path.status == .satisfied {
                self.splashGreetingLabel.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    let vc = HomeControllerBuilder().build()
                    self.view.window?.rootViewController = UINavigationController(rootViewController: vc)
                    self.view.window?.makeKeyAndVisible()
                }
                
            } else {
                let alert = UIAlertController(title: "Warning", message: "Please check your internet connection.", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
