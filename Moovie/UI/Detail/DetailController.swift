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
    private var viewModel: DetailViewModel!
    private var movie: Movie?
    
    var scrollView: UIScrollView = {
        let scrolView = UIScrollView()
        scrolView.showsVerticalScrollIndicator = false
        return scrolView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    var relaesedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    var runTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    var imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var reviewCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var plotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    var directorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    var starView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "star.fill") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.systemYellow
        return imageView
    }()
    
    var clockView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "clock") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    var calendarView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "calendar") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    var ticketView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "ticket") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    var personView: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(systemName: "person") {
            image.withRenderingMode(.alwaysTemplate)
            imageView.image = image
        }
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findMovieById(id: self.movieId)

        configureUI()
    }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Privates

private extension DetailController {
    
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
