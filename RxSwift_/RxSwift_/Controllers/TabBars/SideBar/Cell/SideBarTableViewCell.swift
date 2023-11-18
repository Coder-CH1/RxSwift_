//
//  SideBarTableViewCell.swift
//  RxSwift_
//
//  Created by Mac on 18/11/2023.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {
    
    let identifier = "SideBarTableViewCell"
    
    let profileIcon = CustomImageView(image: UIImage(named: ""))
    
    let profileLabel = Label(label: "", textColor: .white, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var profileStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileIcon, profileLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        stack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            parentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
}
