//
//  MovieCell.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
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
        
        let movieCellViewModel = MovieCellViewModel.init(withMovie: movie)
    
        self.movieIV.layer.cornerRadius = 4
        
        self.movieIV.image = movieCellViewModel.getMovieImage(forImageView: self.movieIV, withUrl: movieCellViewModel.getMovieBackdropUrl())
        self.tituloLbl.text = movieCellViewModel.getMovieTitle()
        
    }
}
