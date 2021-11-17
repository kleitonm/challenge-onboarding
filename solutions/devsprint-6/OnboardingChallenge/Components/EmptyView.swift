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

final class EmptyView: UIView {
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(configContraint)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var titleLabel: UILabel = {
        let titleLabel: UILabel
        titleLabel.text = "No repositories found"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
        }()
    
        private var subTitleLabel: UILabel = {
        let subTitleLabel: UILabel
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
        let configuration = EmptyViewConfiguration(title: "No repositories found", subtitle: "Search repositories found")
        let emptyView = EmptyView()
        emptyView.configure(with: configuration)
    

    }

    
    func configContraint() {
        
        titleLabel.centerXanchor.constraint(equalTo: centerXAnchor).isActivite = true
        titleLabel.centerYanchor.constraint(equalTo: centerYAnchor).isActivite = true
        
        subTitleLabel.centerXanchor.constraint(equalTo: centerXAnchor).isActivite = true
        subTitleLabel.centerYanchor.constraint(equalTo: centerYAnchor).isActivite = true
        
    }
    


