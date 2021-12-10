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

 class PropertyListViewController: UIViewController {
    
    private let service = Service()
    private lazy var PropertyListView: ListView = {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        Events()
    }
    
    override func loadView() {
        super.loadView()
        navigationItem.searchController = searchController
    }
    
    func SettingsView() {
        let settingsViewController = SettingsViewController()
        let navBarController = UINavigationController(rootViewController: SettingsViewController)
        navBarController.navigationBar.backgroundColor = .systemGray5
        navigationController?.present(navBarController , animated: true, completion: nil)
    }
    
    private func Events() {
        ListView.didSelectedRow = { [weak self] item in
            self?.instanceDetailsOf(item)
        }
    }
    
    private func setupInterface() {
        title = "Repositories"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(SettingsView))
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func fetchList(for user: String) {
        
        self.service.fetchList(for: User) { items in
            
            let configuration = PropertyListViewController(repositories: items)
            
            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }
    
    private func instanceDetailsOf(_ item: RepositoriesModel) {
        let viewController = DetailViewController()
        viewController.title = item.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PropertyListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchController.searchBar.text)
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
