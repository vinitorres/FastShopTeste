//
//  MoviesViewModel.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoviesViewModel: NSObject {
    
    var moviesList: [Movie] = []
    var loadingMoreMovies = false
    
    func getMovie(withIndex index: IndexPath) -> Movie {
        return moviesList[index.row]
    }
    
    func getMoviesCount() -> Int {
        return moviesList.count
    }
    
    func loadMovies(forGenre genre:Genre, currentPage page: Int ,onComplete: @escaping (_ success: Bool) -> Void) {
        
        Services.getMovies(withGenreID: genre.id, currentPage: page, onComplete: { result in
            if result.count == 0 {
                onComplete(false)
            } else {
                for movie in result {
                    self.moviesList.append(movie)
                }
                onComplete(true)
            }
        })
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.moviesList.count
    }
    
    func cellForRow(at indexPath: IndexPath, from collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.prepare(withMovie: moviesList[indexPath.row])
        return cell
    }
    
    func refreshMoviesList() {
        self.moviesList.removeAll()
    }
    
}

