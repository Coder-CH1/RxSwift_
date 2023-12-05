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
    func seeMoreFoodsButtonTapped()
    func didSelectItem(at index: Int)
}

protocol SeeMoreDrinksDelegate {
    func seeMoreDrinksButtonTapped()
    func didSelectItem(at index: Int)
}

protocol SeeMoreSnacksDelegate {
    func seeMoreSnacksButtonTapped()
    func didSelectItem(at index: Int)
}

protocol SeeMoreSauceDelegate {
    func seeMoreSauceButtonTapped()
    func didSelectItem(at index: Int)
}

