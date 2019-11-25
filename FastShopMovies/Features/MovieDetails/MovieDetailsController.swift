//
//  MovieDetailsController.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet weak var releaseDatePlaceholderLbl: UILabel!
    @IBOutlet weak var overviewPlaceholderLbl: UILabel!

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!

    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var movieDetailsViewModel: MovieDetailsViewModel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeBtn.layer.cornerRadius = self.closeBtn.frame.size.height/2
        translateViews()
        setupView()
    }
    
    //*************************************************
    // MARK: - Private Methods
    //*************************************************

    private func translateViews() {
        self.releaseDatePlaceholderLbl.text = movieDetailsViewModel.setReleaseDatePlaceholder()
        self.overviewPlaceholderLbl.text = movieDetailsViewModel.setOverviewPlaceholder()
    }
    
    private func setupView() {
        self.titleLbl.text = movieDetailsViewModel.getMovieTitle()
        self.yearLbl.text = movieDetailsViewModel.getMovieReleaseDate()
        self.overviewLbl.text = movieDetailsViewModel.getMovieOverview()
        self.coverIV.image =
            movieDetailsViewModel.getMovieImage(
                forImageView: self.coverIV,
                withUrl: movieDetailsViewModel.getMoviePosterUrl())
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
