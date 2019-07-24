//
//  GenresViewModel.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 18/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class GenresViewModel: NSObject {
    
    var genreList: [Genre] = []
    
    func setNavigationTitle() -> String {
        return String.FastShopMovies.navigationTitle
    }
    
    func getGenre(withIndex index: Int) -> Genre {
        return genreList[index]
    }
    
    func loadGenres(onComplete: @escaping (_ success: Bool) -> Void) {
        
        Services.getGenres(onComplete: { result in
            if result.isEmpty {
                onComplete(false)
            } else {
                self.genreList = result
                onComplete(true)
            }
        })
       
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return self.genreList.count
    }
    
    func cellForRow(at indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = genreList[indexPath.row].name
        return cell
        
    }
    
}
