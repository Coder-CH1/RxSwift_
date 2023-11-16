//
//  TabBarViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate  {
    
    let controllers = UITabBarController()
    let firstVC = UINavigationController(rootViewController: HomeViewController())
    let secondVC = UINavigationController(rootViewController: FavoritesViewController())
    let thirdVC = UINavigationController(rootViewController: ProfileViewController())
    let fourthVC = UINavigationController(rootViewController: HistoryViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        delegate = self
    }
    
    func setupViewControllers() {
        let vcIcons = [
            UIImage(named: "homeIcon"),
            UIImage(named: "favoriteIcon"),
            UIImage(named: "profileIcon"),
            UIImage(named: "historyIcon")
        ]
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
        tabBar.tintColor = #colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.7336546183, green: 0.733869493, blue: 0.7404955029, alpha: 1)
        
        guard let icons = self.tabBar.items else { return }
        for icon in 0...3 {
            icons[icon].image = vcIcons[(icon)]
        }
    }
}
