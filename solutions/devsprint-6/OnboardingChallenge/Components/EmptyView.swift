//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Kleiton Mendes on 09/11/2021.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class EmptyView: UIView {
    
    
    let titlelabel: UILabel()
    titlelabel.text = "No repositories found"
    titlelabel.translatesAutoresizingMaskIntoConstraints = false
    titlelabel.textColor = UIColor.darktextcolor
    titlelabel.font = UIFont.systemFont(ofSize: 16)
    return titlelabel
    
    
    let subtitlelabel: UILabel()
    subtitlelabel.text = "Search repositories found"
    subtitlelabel.translatesAutoresizingMaskIntoConstraints = false
    subtitlelabel.textColor = UIColor.gray
    subtitlelabel.font = UIFont.systemFont(ofSize: 14)
    return subtitlelabel
    
    self.backgroundcolor = .white
    
    self.addsuSubView(self.EmptyView)
    self.insertSubview:aboveSubview:subtitlelabel
    
    //add contranint
    self.titlelabel.centerXanchor.constraint(equalTo:self.centerXAnchor).isActivite = true
    self.titlelabel.centerXanchor.constraint(equalTo:self.centerYAnchor).isActivite = true
    
    self.subtitlelabel.centerXanchor.constraint(equalTo:self.centerXAnchor).isActivite = true
    self.subtitlelabel.centerXanchor.constraint(equalTo:self.centerYAnchor).isActivite = true
