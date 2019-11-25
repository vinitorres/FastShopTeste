//
//  Genre.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 16/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class Genre {
    
    var id: Int = 0
    var name: String = ""
    
    init() {
        
    }
    
    init(json: JSON) {
        
        self.id = json["id"].int ?? 0
        self.name = json["name"].string ?? ""
        
    }
    
}
