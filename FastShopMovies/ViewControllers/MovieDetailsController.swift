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

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!

    var movie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.closeBtn.layer.cornerRadius = self.closeBtn.frame.size.height/2

        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        self.titleLbl.text = movie.title
        self.yearLbl.text = movie.release_date
        self.overviewLbl.text = movie.overview
        
        self.coverIV.kf.indicatorType = .activity
        self.coverIV.kf.indicator?.view.tintColor  = .white
        self.coverIV.image = UIImage(named: "movie_placeholder")
        
        var urlString = Services.ServiceUrl.MOVIE_IMAGE
        urlString = urlString.replacingOccurrences(of: "{file_path}", with: movie.backdrop_path)
        
        self.coverIV.kf.indicator?.startAnimatingView()
        let resource = ImageResource(downloadURL: URL(string: urlString)!, cacheKey: urlString)
        self.coverIV.kf.setImage(with: resource) { (image, _, _, _) in
            self.coverIV.kf.indicator?.stopAnimatingView()
            if image == nil {
                self.coverIV.image = UIImage(named: "movie_placeholder")
            }
        }
        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
