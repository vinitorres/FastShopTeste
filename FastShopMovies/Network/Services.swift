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
    
    static func getMovies(withGenreID id: Int, currentPage page: Int, onComplete: @escaping ([Movie]) -> Void) {
        
        var url = Constants.ServiceUrl.moviesForGenre
        url = url.replacingOccurrences(of: "{page}", with: page.description)
        url = url.replacingOccurrences(of: "{genreID}", with: id.description)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            var listMovies: [Movie] = []
            
            if let resultData = response.data {
                
                guard let jsonObject = try? JSON(data: resultData)
                    else { return }
                
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
    
    static func getGenres(onComplete: @escaping ([Genre]) -> Void) {
        
        let url = Constants.ServiceUrl.genres
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
            
            var listGenres: [Genre] = []
            
            if let resultData = response.data {
                
                guard let jsonObject = try? JSON(data: resultData) else { return }
                
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
