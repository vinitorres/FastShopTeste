//
//  GenresController.swift
//  FastShopMovies
//
//  Created by André Vinícius Torres Conrado on 16/07/19.
//  Copyright © 2019 vini.torres. All rights reserved.
//

import UIKit

class GenresController: UIViewController {
    
    //*************************************************
    // MARK: - Outlets
    //*************************************************
    
    @IBOutlet private weak var tableView: UITableView!
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************
    
    var viewModel = GenresViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translateViews()
        
        // Navigation
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        // Table View
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // LoadData
        self.loadData()
        
    }
    
    //*************************************************
    // MARK: - Public Methods
    //*************************************************
    
    func loadData() {
        viewModel.loadGenres { (result) in
            if result {
                self.tableView.reloadData()
            } else {
                print("Error to fetch Genre data")
            }
        }
    }
    
    func translateViews() {
        self.title = viewModel.setNavigationTitle()
    }
    
}

    //*************************************************
    // MARK: - UITableViewDataSource
    //*************************************************

extension GenresController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRow(at: indexPath, from: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = self.storyboard?.instantiateViewController(
            withIdentifier: "Movies") as? MoviesController
            else {
            fatalError("instantiateViewController failed while casting")
        }
        
        controller.selectedGenre = viewModel.getGenre(withIndex: indexPath.row)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.show(controller, sender: nil)
        }
        
    }
    
}
