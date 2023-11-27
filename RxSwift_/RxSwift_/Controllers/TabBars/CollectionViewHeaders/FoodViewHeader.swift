//
//  FoodViewHeader.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

// MARK: - Reusableview for the section headers
class FoodViewHeader: UICollectionReusableView {
    
    static let identifier = "FoodViewHeader"
    
    lazy var foodHeader: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configure() {
        addSubview(foodHeader)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHeaders()
    }
    
    func setupHeaders() {
        NSLayoutConstraint.activate([
            foodHeader.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            foodHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}
