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
    private var viewModel: HomeViewModel!
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset =  UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for movie.."
        searchBar.autocapitalizationType = .none
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default search
        searchMovieByTitle(title: "men")
        
        configureUI()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if movies.count < 1 {
            view.startIndicatorAnimation()
        }
        
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

}

// MARK: - Privates

private extension HomeController {
    
    func searchMovieByTitle(title: String) {
        viewModel.fetchMoviesBySearchTerm(term: title, completion: { [weak self] in
            guard let self = self else { return }
            self.view.stopIndicatorAnimation()
            
            self.movies = self.viewModel.returnSearchResult()
            self.collectionView.reloadData()
            
            if self.movies.count < 1 {
                self.view.stopIndicatorAnimation()
                let alert = UIAlertController(title: "Warning", message: "Result not found, try again.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                    self.searchBar.text = ""
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
            
        })
    }
    
    func configureUI() {
        hideKeyboardWhenTappedAround()
        
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
    
    func configureCollectionView() {
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
        let movie = movies[indexPath.row]
        let detailVC = DetailControllerBuilder().build(viewModel: DetailViewModel())
        
        if let imdbID = movie.imdbID {
            detailVC.movieId = imdbID
            navigationController?.pushViewController(detailVC, animated: true)
        }
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
