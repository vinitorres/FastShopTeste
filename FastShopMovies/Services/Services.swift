//
//  Services.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 15/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Services {
    
    struct ServiceUrl {
        static let URL_BASE = "https://api.themoviedb.org/3/"
        static let GENRES = URL_BASE+"genre/movie/list?api_key=\(API_KEY)&language=pt-BR"
        static let MOVIES_FOR_GENRE = URL_BASE+"discover/movie?api_key=\(API_KEY)&language=pt-BR&sort_by=popularity.desc&include_adult=false&with_genres={genreID}&&include_video=false&page={page}"
        static let API_KEY = "8e778ba5d415f5223bd045dc2e173dce"
        static let MOVIE_IMAGE = "https://image.tmdb.org/t/p/w500{file_path}"

    }
    
    static func getMovies(withGenreID id:Int,currentPage page:Int, onComplete: @escaping ([Movie]) -> ()) {
        
        var url = ServiceUrl.MOVIES_FOR_GENRE
        url = url.replacingOccurrences(of: "{page}", with: page.description)
        url = url.replacingOccurrences(of: "{genreID}", with: id.description)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            var listMovies: [Movie] = []
            
            if let resultData = response.data {
                
                let jsonObject = try! JSON(data: resultData)
                
                if let arrayMovies = jsonObject["results"].arrayObject {
                    for movieObject in arrayMovies {
                        let movie = Movie(json: JSON(movieObject))
                        listMovies.append(movie)
                    }
                }
                onComplete(listMovies)
            }
            
        })
        
    }
    
    static func getGenres(onComplete: @escaping ([Genre]) -> ()) {
        
        let url = ServiceUrl.GENRES
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            var listGenres: [Genre] = []
            
            if let resultData = response.data {
                
                let jsonObject = try! JSON(data: resultData)
                
                if let arrayGenres = jsonObject["genres"].arrayObject {
                    for genreObject in arrayGenres {
                        let genre = Genre(json: JSON(genreObject))
                        listGenres.append(genre)
                    }
                }
                onComplete(listGenres)
            }
            
        })
        
    }
    
}
