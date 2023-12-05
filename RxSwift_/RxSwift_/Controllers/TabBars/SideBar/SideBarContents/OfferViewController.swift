//
//  OfferViewController.swift
//  RxSwift_
//
//  Created by Mac on 17/11/2023.
//

import UIKit

class OfferViewController: UIViewController {
    
    let offersLabel = Label(label: "My offers", textColor: .black, font: UIFont.systemFont(ofSize: 25, weight: .medium))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(offersLabel)
        NSLayoutConstraint.activate([
            offersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            offersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
}
