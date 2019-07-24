//
//  GenresController.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 16/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit

class GenresController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var genresViewModel = GenresViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translateViews()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        genresViewModel.loadGenres { (result) in
            if result {
                self.tableView.reloadData()
            }
        }
    }
    
    func translateViews() {
        self.title = genresViewModel.setNavigationTitle()
    }
    
}

extension GenresController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genresViewModel.numberOfRows()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genresViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return genresViewModel.cellForRow(at: indexPath, from: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = self.storyboard?.instantiateViewController(
            withIdentifier: "Movies") as? MoviesController
            else {
            fatalError("instantiateViewController failed while casting")
        }
        controller.selectedGenre = genresViewModel.getGenre(withIndex: indexPath.row)
        self.show(controller, sender: nil)
    }
    
}
