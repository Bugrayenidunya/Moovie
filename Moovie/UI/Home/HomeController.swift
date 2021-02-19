//
//  HomeController.swift
//  Moovie
//
//  Created by Bugra's Mac on 17.02.2021.
//

import Kingfisher
import SnapKit
import UIKit

class HomeController: UIViewController {
    
    // MARK: Properties
    
    private var movies: [Search] = []
    private var searchTerm: String = ""
    var viewModel: HomeViewModel?
    
    // MARK: Views
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset =  UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for movie.."
        searchBar.autocapitalizationType = .none
        return searchBar
    }()
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default search
        searchMovieByTitle(title: "men")
        
        // Inits
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.startIndicatorAnimation()
    }
    
    // MARK: Actions
    
    @objc func performSearhTask() {
        if self.searchTerm.count > 2 {
            movies = []
            collectionView.reloadData()
            view.startIndicatorAnimation()
            searchMovieByTitle(title: self.searchTerm)
        }
    }
    
    // MARK: Functions
    
    private func searchMovieByTitle(title: String) {
        viewModel?.fetchMoviesBySearchTerm(term: title, completion: { [weak self] in
            guard let self = self else { return }
            self.view.stopIndicatorAnimation()
            
            if let searchedMovies = self.viewModel?.returnSearchResult() {
                self.movies = searchedMovies
                self.collectionView.reloadData()
                
                if self.movies.count < 1 {
                    self.view.stopIndicatorAnimation()
                    let alert = UIAlertController(title: "Warning", message: "Result not found, try again.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        self.searchBar.text = ""
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchBar.delegate = self
        
        view.addSubview(collectionView)
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalTo(view.snp.trailing)
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: Constant.UIConstants.movieCell)
    }
    
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.UIConstants.movieCell, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        
        cell.backgroundColor = .white
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = movie.year
        
        if let moviePosterUrl = movie.poster {
            cell.imageView.kf.setImage(
                with: URL(string: moviePosterUrl),
                placeholder: UIImage(named: Constant.UIConstants.noImageFound),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: - Do This: navigate to detail
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

// MARK: - UISearchBarDelegate

extension HomeController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.performSearhTask), object: nil)
        self.perform(#selector(self.performSearhTask), with: nil, afterDelay: 0.5)
    }
    
}
