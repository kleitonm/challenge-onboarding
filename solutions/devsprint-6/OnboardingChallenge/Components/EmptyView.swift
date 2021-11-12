//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Kleiton Mendes on 09/11/2021.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

final class EmptyView: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    
   
    //label configuration
    //private var emptyMessageLabel: UILabel = {
    private var titleLabel: UILabel = {
    let label: UILabel
    label.text = "No repositories found"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = UIColor.darkText
    label.font = UIFont.systemFont(ofSize: 16)
    return label
    }()
    
    private var subTitleLabel: UILabel = {
    let label: UILabel
    label.text = "Search repositories found"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = UIColor.gray
    label.font = UIFont.systemFont(ofSize: 14)
    return label
    }()
    
    struct EmptyViewConfiguration {
        let title: String
        let subtitle: String
    }
    func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.title
        subtitleLabel.text = configuration.subtitle
    }
    let configuration = EmptyViewConfiguration(title: "No repositories found", subtitle: "Search repositories found")
    let emptyView = EmptyView()
    emptyView.configure(with: configuration)
    
    func configureSubView() {
        
    self.addSubview(emptyMessageLabel)

    self.backgroundColor = .white
        
    }
    
    //add view
    addSubView(titlelabel)
    addSubView(subtitlelabel)
    
    //add contranint
    func configurationcontrains() {
    
        self.titleLabel.centerXanchor.constraint(equalTo:self.centerXAnchor).isActivite = true
        self.titleLabel.centerXanchor.constraint(equalTo:self.centerYAnchor).isActivite = true


        self.subTitleLabel.centerXanchor.constraint(equalTo:self.centerXAnchor).isActivite = true
        self.subTitleLabel.centerXanchor.constraint(equalTo:self.centerYAnchor).isActivite = true
    }
    
    
    init() {
    super.init(frame: .zero)
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
}
