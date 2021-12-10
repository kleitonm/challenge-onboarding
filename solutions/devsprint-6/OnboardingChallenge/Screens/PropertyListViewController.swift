//
//  PropertyListViewController.swift
//  OnboardingChallenge
//
//  Created by Kleiton Mendes on 10/12/2021.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class PropertyListViewController: UIViewController {
    
    private lazy var propertyListView: ListView = {
        return ListView()
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a city or neighborhood"
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        title = "Real Estate App"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = propertyListView
    }
    
}

extension PropertyListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchController.searchBar.text)
    }
}
