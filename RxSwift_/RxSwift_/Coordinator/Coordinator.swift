//
//  Coordinator.swift
//  RxSwift_
//
//  Created by Mac on 01/12/2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SegmentedControlViewController.init()
        vc.appCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
//    func tapToSegmentedControlVC() {
//        print("tapToSegmentedControlVC method called")
//        let vc = SegmentedControlViewController()
//        vc.appCoordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
}



