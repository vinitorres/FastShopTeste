//
//  Movie.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class Movie: NSObject {
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var id: Int64 = 0
    var title: String = ""
    var overview: String = ""
    var releaseDate: String = ""
    var posterPath: String = ""
    var backdropPath: String = ""

    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    init(json: JSON) {
        
        self.id = json["id"].int64 ?? 0
        self.title = json["title"].string ?? ""
        self.overview = json["overview"].string ?? ""
        self.releaseDate = json["release_date"].string ?? ""
        self.posterPath = json["poster_path"].string ?? ""
        self.backdropPath = json["backdrop_path"].string ?? ""

    }

}
