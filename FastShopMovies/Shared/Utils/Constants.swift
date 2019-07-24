//
//  Constants.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import Foundation

class Constants {
    
    static let apiKey = "8e778ba5d415f5223bd045dc2e173dce"
    
    struct ServiceUrl {
        static let urlBase = "https://api.themoviedb.org/3/"
        static let genres = urlBase+"genre/movie/list?api_key=\(apiKey)&language=pt-BR"
        static let moviesForGenre = urlBase+"discover/movie?api_key=\(apiKey)&language=pt-BR&sort_by=popularity.desc&include_adult=false&with_genres={genreID}&&include_video=false&page={page}"
        static let movieImage = "https://image.tmdb.org/t/p/w500{file_path}"
        
    }
    
}
