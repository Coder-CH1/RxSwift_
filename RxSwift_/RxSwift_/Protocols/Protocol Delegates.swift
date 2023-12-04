//
//  Protocol Delegates.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

protocol SidebarViewControllerDelegate {
    func sideBarDidToggleBack()
}

protocol EditViewControllerDelegate {
    func didUpdateProfile(phoneNumber: String, emailAddress: String)
}

protocol LoginViewControllerDelegate {
    func customViewDidPresentVC()
}

protocol SeeMoreFoodsDelegate {
func navigateToSeeMoreFoodsVC()
}

protocol SeeMoreDrinksDelegate {
func navigateToSeeMoreDrinksVC()
}

protocol SeeMoreSnacksDelegate {
func navigateToSeeMoreSnacksVC()
}

protocol SeeMoreSauceDelegate {
func navigateToSeeMoreSauceVC()
}

protocol FoodsViewCollectionViewDelegate{
    func presentView(cell: FoodsViewCollectionViewCell)
}
