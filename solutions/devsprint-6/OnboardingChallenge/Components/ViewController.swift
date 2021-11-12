//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Kleiton Mendes on 10/11/2021.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class ViewControler: UIViewController {
    
    let screen = EmptyView()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
