//
//  SeeMoreFoodsViewController.swift
//  RxSwift_
//
//  Created by Mac on 29/11/2023.
//

import UIKit

//MARK: - SeeMoreFoodsViewController property objects and constraints
class SeeMoreFoodsViewController: UIViewController {
    
    var num: Int = 0
    
    var titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureTitleLabel()
    }
    
    func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.text = "found \(num) result"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    func setupViews() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
