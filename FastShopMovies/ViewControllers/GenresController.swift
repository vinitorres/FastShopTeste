//
//  GenresController.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 16/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class GenresController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var genreList = [Genre]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Lista de generos"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        loadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        Services.getGenres(onComplete: { result in
            self.genreList = result
            self.tableView.reloadData()
        })
    }
    
    
}

extension GenresController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = genreList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "Movies") as! MoviesController
        controller.selectedGenre = genreList[indexPath.row]
        self.show(controller, sender: nil)
    }
    
    
}
