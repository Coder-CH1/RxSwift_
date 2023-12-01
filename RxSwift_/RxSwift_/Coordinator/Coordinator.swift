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
        let vc = SegmentedControlViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}

