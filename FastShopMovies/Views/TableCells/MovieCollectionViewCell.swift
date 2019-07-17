//
//  MovieCollectionViewCell.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieIV: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func resetValues() {
        self.tituloLbl.text = ""
        self.movieIV.image = nil
        
    }
    
    func prepare(withMovie movie: Movie) {
    
        self.resetValues()
    
        self.movieIV.layer.cornerRadius = 4
        self.movieIV.kf.indicatorType = .activity
        self.movieIV.kf.indicator?.view.tintColor  = .white
        
        var urlString = Services.ServiceUrl.MOVIE_IMAGE
        urlString = urlString.replacingOccurrences(of: "{file_path}", with: movie.poster_path)

        self.movieIV.kf.indicator?.startAnimatingView()
        let resource = ImageResource(downloadURL: URL(string: urlString)!, cacheKey: urlString)
        self.movieIV.kf.setImage(with: resource) { (image, _, _, _) in
            self.movieIV.kf.indicator?.stopAnimatingView()
            if image == nil {
                self.movieIV.image = UIImage(named: "movie_placeholder")
                self.movieIV.kf.indicator?.stopAnimatingView()
            }
        }
        
        self.tituloLbl.text = movie.title
    }
}
