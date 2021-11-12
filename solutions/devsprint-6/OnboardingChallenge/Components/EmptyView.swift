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
        titleLabel.textColor = UIColor.darkText
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        return titleLabel
        }()
    
        private var subTitleLabel: UILabel = {
        let subTitleLabel: UILabel
        subTitleLabel.text = "Search repositories found"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textColor = UIColor.gray
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        return subTitleLabel
        }()
    
        func updateView(with configuration: EmptyViewConfiguration) {
            titleLabel.text = configuration.title
            subTitleLabel.text = configuration.subtitle
        }
        let configuration = EmptyViewConfiguration(title: "No repositories found", subtitle: "Search repositories found")
        let emptyView = EmptyView()
        EmptyView.configure(with: configuration)
    
    
    self.backgroundColor = .white
    

    }
    
    func configContraint() {
        
        titleLabel.centerXanchor.constraint(equalTo: centerXAnchor).isActivite = true
        titleLabel.centerYanchor.constraint(equalTo: centerYAnchor).isActivite = true
        
        subTitleLabel.centerXanchor.constraint(equalTo: centerXAnchor).isActivite = true
        subTitleLabel.centerYanchor.constraint(equalTo: centerYAnchor).isActivite = true
    }
    


