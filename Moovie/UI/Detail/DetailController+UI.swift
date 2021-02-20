//
//  DetailController+UI.swift
//  Moovie
//
//  Created by Bugra's Mac on 20.02.2021.
//

import SnapKit

extension DetailController {
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Detail"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starView)
        contentView.addSubview(imdbRatingLabel)
        contentView.addSubview(reviewCountLabel)
        contentView.addSubview(clockView)
        contentView.addSubview(runTimeLabel)
        contentView.addSubview(calendarView)
        contentView.addSubview(relaesedLabel)
        contentView.addSubview(ticketView)
        contentView.addSubview(genreLabel)
        contentView.addSubview(personView)
        contentView.addSubview(directorLabel)
        contentView.addSubview(plotLabel)
        
        scrollView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.width.equalTo(scrollView.snp.width)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(256)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        starView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.width.equalTo(24)
        }
        
        imdbRatingLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(starView.snp.centerY)
            make.leading.equalTo(starView.snp.trailing).offset(4)
        }
        
        reviewCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(starView.snp.centerY)
            make.leading.equalTo(imdbRatingLabel.snp.trailing).offset(8)
        }
        
        clockView.snp.makeConstraints { (make) in
            make.top.equalTo(starView.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.width.equalTo(24)
        }
        
        runTimeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(clockView.snp.centerY)
            make.leading.equalTo(clockView.snp.trailing).offset(4)
        }
        
        calendarView.snp.makeConstraints { (make) in
            make.top.equalTo(clockView.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.width.equalTo(24)
        }
        
        relaesedLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(calendarView.snp.centerY)
            make.leading.equalTo(calendarView.snp.trailing).offset(4)
        }
        
        ticketView.snp.makeConstraints { (make) in
            make.top.equalTo(calendarView.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.width.equalTo(24)
        }
        
        genreLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(ticketView.snp.centerY)
            make.leading.equalTo(ticketView.snp.trailing).offset(4)
        }
        
        personView.snp.makeConstraints { (make) in
            make.top.equalTo(ticketView.snp.bottom).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.height.width.equalTo(24)
        }
        
        directorLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(personView.snp.centerY)
            make.leading.equalTo(personView.snp.trailing).offset(4)
        }
        
        plotLabel.snp.makeConstraints { (make) in
            make.top.equalTo(directorLabel.snp.bottom).offset(24)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }
    }
}
