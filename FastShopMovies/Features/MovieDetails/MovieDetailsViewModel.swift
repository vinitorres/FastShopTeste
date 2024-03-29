//
//  MovieDetailsViewModel.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import Foundation

import Kingfisher

class MovieDetailsViewModel: NSObject {
    
    let movie: Movie!
    
    init(withMovie movie: Movie) {
        self.movie = movie
    }
    
    func setReleaseDatePlaceholder() -> String {
        return String.FastShopMovies.releaseDate
    }
    
    func setOverviewPlaceholder() -> String {
        return String.FastShopMovies.overview
    }
    
    func getMovieTitle() -> String {
        return movie.title
    }
    
    func getMovieReleaseDate() -> String {
        return movie.releaseDate
    }
    
    func getMovieOverview() -> String {
        return movie.overview
    }
    
    func getMoviePosterUrl() -> String {
        return movie.posterPath
    }
    
    func getMovieImage(forImageView imageView: UIImageView, withUrl url: String) -> UIImage {
        
        imageView.kf.indicatorType = .activity
        imageView.kf.indicator?.view.tintColor  = .white
        
        var coverImage = UIImage()
        let placeholderImage = UIImage(named: "movie_placeholder")
        
        var urlString = Constants.ServiceUrl.movieImage
        urlString = urlString.replacingOccurrences(of: "{file_path}", with: url)
        
        imageView.kf.indicator?.startAnimatingView()
        let resource = ImageResource(downloadURL: URL(string: urlString)!, cacheKey: urlString)
        imageView.kf.setImage(with: resource) { (image, _, _, _) in
            imageView.kf.indicator?.stopAnimatingView()
            if image == nil {
                coverImage = placeholderImage!
            } else {
                coverImage = image!
            }
        }
        
        return coverImage
    }
    
}
