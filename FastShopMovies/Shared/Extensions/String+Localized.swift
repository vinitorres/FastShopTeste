//
//  String+Localized.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit

extension String {
    
    struct FastShopMovies {
        
        //*************************************************
        // MARK: - Genres
        //*************************************************
        
        static var navigationTitle: String { return "NAVIGATION_TITLE".localized }
        
        //*************************************************
        // MARK: - Movie Details
        //*************************************************
        
        static var releaseDate: String { return "RELEASE_DATE".localized }
        static var overview: String { return "OVERVIEW".localized }
    
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
}
