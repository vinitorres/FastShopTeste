//
//  Constants.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import Foundation

class Constants {
    
    static let API_KEY = "8e778ba5d415f5223bd045dc2e173dce"
    
    struct ServiceUrl {
        static let URL_BASE = "https://api.themoviedb.org/3/"
        static let GENRES = URL_BASE+"genre/movie/list?api_key=\(API_KEY)&language=pt-BR"
        static let MOVIES_FOR_GENRE = URL_BASE+"discover/movie?api_key=\(API_KEY)&language=pt-BR&sort_by=popularity.desc&include_adult=false&with_genres={genreID}&&include_video=false&page={page}"
        static let MOVIE_IMAGE = "https://image.tmdb.org/t/p/w500{file_path}"
        
    }
    
}
