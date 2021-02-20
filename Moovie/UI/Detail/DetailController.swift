//
//  DetailController.swift
//  Moovie
//
//  Created by Bugra's Mac on 19.02.2021.
//

import Firebase
import Kingfisher
import UIKit
import SnapKit

class DetailController: UIViewController {
    
    // MARK: Properties
    
    var movieId: String = ""
    var viewModel: DetailViewModel?
    private var movie: Movie?
    
    // MARK: Views
    
    private lazy var scrollView: UIScrollView = {
        let scrolView = UIScrollView()
        scrolView.showsVerticalScrollIndicator = false
        return scrolView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var relaesedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var runTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var reviewCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var plotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private lazy var starView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "star.fill") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.systemYellow
        return imageView
    }()
    
    private lazy var clockView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "clock") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    private lazy var calendarView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "calendar") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    private lazy var ticketView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "ticket") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    private lazy var personView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "person") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    // MARK: Lyfcycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findMovieById(id: self.movieId)

        // Inits
        configureUI()
    }
    
    // MARK: Actions
    
    
    // MARK: Functions
    
    private func configureUI() {
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
    
    private func findMovieById(id: String) {
        view.startIndicatorAnimation()
        viewModel?.findMovieById(id: id, completion: { [weak self] in
            guard let self = self else { return }
            
            self.view.stopIndicatorAnimation()
            self.movie = self.viewModel?.returnFetchedMovie()
            
            if let movie = self.movie {
                self.imageView.kf.setImage(
                    with: URL(movie.poster ?? ""),
                    placeholder: UIImage(named: Constant.UIConstants.noImageFound),
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                
                self.titleLabel.text = movie.title
                self.imdbRatingLabel.text = "\(movie.imdbRating ?? "Rating is not available")"
                self.reviewCountLabel.text = "- \(movie.imdbVotes ?? "Vote is not available")"
                self.runTimeLabel.text = movie.runtime
                self.relaesedLabel.text = movie.released
                self.genreLabel.text = movie.genre
                self.plotLabel.text = movie.plot
                self.directorLabel.text = movie.director
                
                self.logMovieDetail(movie: Movie(title: movie.title, released: movie.released, runtime: movie.runtime, genre: movie.genre, director: movie.director, plot: movie.plot, imdbRating: movie.imdbRating, imdbVotes: movie.imdbVotes))
            }
            
        })
    }
    
    private func logMovieDetail(movie: Movie) {
        Analytics.logEvent(Constant.AnalyticsConstants.logMovieDetailEvent,
                      parameters: [
                        Constant.AnalyticsConstants.title : movie.title ?? Constant.AnalyticsConstants.null,
                        Constant.AnalyticsConstants.imdbRating : movie.imdbRating ?? Constant.AnalyticsConstants.null,
                        Constant.AnalyticsConstants.reviewCount: movie.imdbVotes ?? Constant.AnalyticsConstants.null,
                        Constant.AnalyticsConstants.relased: movie.released ?? Constant.AnalyticsConstants.null,
                        Constant.AnalyticsConstants.director: movie.director ?? Constant.AnalyticsConstants.null
                      ]
        )
    }

}
