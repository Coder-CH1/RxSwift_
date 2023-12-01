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

protocol Coordinator {
var navigationController: UINavigationController {get set}
func start()
}

protocol AppCoordinateDelegate {
    func appCoordinate()
}
