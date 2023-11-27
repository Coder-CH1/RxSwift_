//
//  DrinksViewHeader.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

// MARK: - Reusableview for the section headers
class DrinksViewHeader: UICollectionReusableView {
    
    static let identifier = "DrinksViewHeader"
    
    lazy var drinksHeader: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configure() {
        addSubview(drinksHeader)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHeaders()
    }
    
    func setupHeaders() {
        NSLayoutConstraint.activate([
            drinksHeader.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            drinksHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}

