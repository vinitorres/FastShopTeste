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
    
//    {
//    "vote_count": 1707,
//    "id": 429617,
//    "video": false,
//    "vote_average": 7.8,
//    "title": "Homem-Aranha: Longe de Casa",
//    "popularity": 596.697,
//    "poster_path": "/6wtOOCzTNxzwzwvpMeimMHQNTqI.jpg",
//    "original_language": "en",
//    "original_title": "Spider-Man: Far from Home",
//    "genre_ids": [
//    28,
//    12,
//    878
//    ],
//    "backdrop_path": "/dihW2yTsvQlust7mSuAqJDtqW7k.jpg",
//    "adult": false,
//    "overview": "Peter Parker está de volta em Homem-Aranha: Longe de Casa, novo capítulo da série De Volta Ao Lar. Nosso amigão da vizinhança decide se unir aos seus melhores amigos para passar férias na Europa. Mas o plano de Peter de abandonar seus feitos heroicos por algumas semanas logo são mudados quando ele concorda em ajudar Nick Fury a solucionar o mistério de ataques de criaturas elementais, criando uma destruição pelo continente...",
//    "release_date": "2019-06-28"
//    }
    
    var id: Int64 = 0
    var title: String = ""
    var overview: String = ""
    var release_date: String = ""
    var poster_path: String = ""
    var backdrop_path: String = ""

    override init() {
        
    }
    
    init(json: JSON) {
        
        self.id = json["id"].int64 ?? 0
        self.title = json["title"].string ?? ""
        self.overview = json["overview"].string ?? ""
        self.release_date = json["release_date"].string ?? ""
        self.poster_path = json["poster_path"].string ?? ""
        self.backdrop_path = json["backdrop_path"].string ?? ""

    }

}
