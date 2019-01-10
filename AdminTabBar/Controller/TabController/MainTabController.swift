//
//  MainTabController.swift
//  AdminTabBar
//
//  Created by Stephen Dowless on 1/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    var user: User?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - API
    
    func authenticateUser() {
        
        if user == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: SignUpController())
                self.present(navController, animated: true, completion: nil)
            }
        } else {
            configureViewComponents()
        }
        
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = .mainBlue()
        configureViewControllers()
    }
    
    func configureViewControllers() {
        guard let user = self.user else { return }
        
        let homeController = HomeController()
        homeController.tabBarItem.title = "Home"
        homeController.delegate = self 
        
        let postController = PostController()
        postController.tabBarItem.title = "Post"

        let profileController = ProfileController()
        profileController.tabBarItem.title = "Profile"
        
        if user.accountType == .Admin {
            self.viewControllers = [homeController, postController, profileController]
        } else {
            self.viewControllers = [homeController, profileController]
        }
    }
}

extension MainTabController: HomeControllerDelegate {
    
    func setUser(inController controller: HomeController) {
        guard let user = self.user else { return }
        controller.user = user 
    }
}
