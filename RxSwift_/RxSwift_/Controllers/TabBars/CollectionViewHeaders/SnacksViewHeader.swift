//
//  SnacksViewHeader.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

// MARK: - Reusableview for the section headers
class SnacksViewHeader: UICollectionReusableView {
    
    static let identifier = "SnacksViewHeader"
    
    lazy var snacksHeader: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configure() {
        addSubview(snacksHeader)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHeaders()
    }
    
    func setupHeaders() {
        NSLayoutConstraint.activate([
            snacksHeader.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            snacksHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
}
