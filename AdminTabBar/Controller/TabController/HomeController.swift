//
//  HomeController.swift
//  AdminTabBar
//
//  Created by Stephen Dowless on 1/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol HomeControllerDelegate {
    func setUser(inController controller: HomeController)
}

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    var user: User?
    
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBlue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if user == nil {
            fetchUser()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - API
    
    func fetchUser() {
        delegate?.setUser(inController: self)
        print("Username is \(user?.username)")
    }
}
