//
//  UIView+Extension.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import UIKit

extension UIView {
    
    /// Adds activity indicator and darker background to view
    func startIndicatorAnimation() {
        let indicator = UIActivityIndicatorView(style: .large)
        let darkerView = UIView(frame: self.bounds)
        
        darkerView.translatesAutoresizingMaskIntoConstraints = false
        darkerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        darkerView.tag = 1996
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tag = 2021
        
        self.isUserInteractionEnabled = false
        self.addSubview(indicator)
        self.addSubview(darkerView)
        
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicator.startAnimating()
    }
    
    /// Removes added indicator and background from view
    func stopIndicatorAnimation() {
        self.isUserInteractionEnabled = true
        self.subviews.forEach({
            if $0.tag == 2021 || $0.tag == 1996 {
                $0.removeFromSuperview()
            }
        })
    }
    
}
