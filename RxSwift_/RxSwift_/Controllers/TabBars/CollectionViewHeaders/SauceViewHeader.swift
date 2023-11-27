//
//  SauceViewHeader.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

// MARK: - Reusableview for the section headers
class SauceViewHeader: UICollectionReusableView {
    
    static let identifier = "SauceViewHeader"
    
    lazy var sauceHeader: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configure() {
        addSubview(sauceHeader)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHeaders()
    }
    
    func setupHeaders() {
        NSLayoutConstraint.activate([
            sauceHeader.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            sauceHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}
