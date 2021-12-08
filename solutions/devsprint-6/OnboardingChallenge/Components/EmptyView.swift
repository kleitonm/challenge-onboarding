//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Kleiton Mendes on 09/11/2021.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

struct EmptyViewConfiguration {
    let title: String
    let subtitle: String
}

class SearchBar: UISearchController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SearchBar"
        searchBar.text = "Type a city or neighborhood"
        searchBar.tintColor = .lightGray
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}

final class EmptyView: UIView {
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        configContraint()
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        private var titleLabel: UILabel = {
            var titleLabel = UILabel()
            titleLabel.text = "No repositories found"
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.textColor = .black
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 0
            return titleLabel
        }()
        
        private var subTitleLabel: UILabel = {
            var subTitleLabel = UILabel()
            subTitleLabel.text = "Search repositories found"
            subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subTitleLabel.textColor = .gray
            subTitleLabel.font = UIFont.systemFont(ofSize: 14)
            subTitleLabel.textAlignment = .center
            subTitleLabel.numberOfLines = 0
            return subTitleLabel
        }()
        
        func updateView(with configuration: EmptyViewConfiguration) {
            titleLabel.text = configuration.title
            subTitleLabel.text = configuration.subtitle
        }
    
    func configContraint() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            ])
    
    }
    
    
}




