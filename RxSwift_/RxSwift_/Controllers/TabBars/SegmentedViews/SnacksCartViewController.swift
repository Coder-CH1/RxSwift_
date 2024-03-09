//
//  SnacksAddedToCartViewController.swift
//  RxSwift_
//
//  Created by Mac on 15/12/2023.
//

import UIKit

class SnacksCartViewController: UIViewController {

    let completeOrderButton = Button(image: UIImage(systemName: ""), label: "Complete order", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), radius: 30, imageColor: .clear)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(completeOrderButton)
        NSLayoutConstraint.activate([
            completeOrderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            completeOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            completeOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            completeOrderButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
