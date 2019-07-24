//
//  MovieCellViewModel.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCellViewModel: NSObject {

    var movie = Movie()
    
    init(withMovie movie: Movie) {
        self.movie = movie
    }
    
    func getMovieTitle() -> String {
        return movie.title
    }
    
    func getMovieBackdropUrl() -> String {
        return movie.backdropPath
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
