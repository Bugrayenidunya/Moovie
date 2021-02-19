//
//  HomeCollectionViewCell.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    
    // MARK: Views
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 88, height: 88))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        return label
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
        configureUI()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      
    }
    
    // MARK: Functions
    
    private func configureUI() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(yearLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.height.width.equalTo(88)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.bottom.equalTo(yearLabel.snp.top).offset(-8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
        }
        
        yearLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(8)
        }
    }

    
}
