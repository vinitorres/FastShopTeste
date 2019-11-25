//
//  MoviesController.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoviesController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var moviesViewModel = MoviesViewModel()
    var selectedGenre: Genre!

    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    private let refreshControl = UIRefreshControl()
    private var currentPage = 1
    private var loadingMoreMovies = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedGenre.name
        
        // ScrollView
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl.addTarget(self, action: #selector(refreshMovies), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
        
        // CollectionView
        self.collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        self.collectionView.contentInset = sectionInsets
        
        // Load Data
        self.loadData()
        
    }
    
    func setEmpty() {
        
    }
    
    @objc func refreshMovies() {
        currentPage = 1
        self.moviesViewModel.refreshMoviesList()
        self.loadData()
    }
    
    func loadData() {
        loadingMoreMovies = true
        self.moviesViewModel.loadMovies(forGenre: selectedGenre, currentPage: currentPage) { (success) in
            self.refreshControl.endRefreshing()
            if success {
                self.collectionView.reloadData()
            } else {
                self.setEmpty()
            }
            self.loadingMoreMovies = false
        }
    }
    
}

extension MoviesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var viewSize = CGSize()
        
        viewSize.width = collectionView.frame.width/itemsPerRow - self.sectionInsets.left - self.sectionInsets.right/2
        viewSize.height = (viewSize.width/3) * 4 + 60
        
        return viewSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return moviesViewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return moviesViewModel.cellForRow(at: indexPath, from: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(
            withIdentifier: "MovieDetails") as? MovieDetailsController
            else {
            fatalError("instantiateViewController failed while casting")
        }
        
        controller.movieDetailsViewModel =
            MovieDetailsViewModel.init(withMovie: moviesViewModel.getMovie(
                withIndex: indexPath))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.collectionViewHeight.constant = self.collectionView.contentSize.height
    }

}

extension MoviesController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            if moviesViewModel.getMoviesCount() > 0 && !loadingMoreMovies {
                self.currentPage += 1
                self.loadData()
            }
            
        }
    }
}
