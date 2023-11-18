//
//  SideBarCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 17/11/2023.
//

import UIKit

class SideBarCollectionViewCell: UICollectionViewCell {
    
    let profileIcon = CustomImageView(image: UIImage(named: ""))
    
    let profileLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var profileStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileIcon, profileLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    let ordersIcon = CustomImageView(image: UIImage(named: ""))
    
    let ordersLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var ordersStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ordersIcon, ordersLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    let offerIcon = CustomImageView(image: UIImage(named: ""))
    
    let offerLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var offerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [offerIcon, offerLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    let privacyIcon = CustomImageView(image: UIImage(named: ""))
    
    let privacyLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var privacyStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [privacyIcon, privacyLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    let securityIcon = CustomImageView(image: UIImage(named: ""))
    
    let securityLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var securityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [securityIcon, securityLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    lazy var parentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileStackView, ordersStackView, offerStackView, privacyStackView, securityStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .leading
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
   
    func setupViews() {
        self.addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            parentStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            parentStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            parentStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            parentStackView.widthAnchor.constraint(equalToConstant: 300),
            parentStackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
