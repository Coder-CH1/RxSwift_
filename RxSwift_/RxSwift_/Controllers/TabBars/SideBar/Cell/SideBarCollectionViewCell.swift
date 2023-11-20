//
//  SideBarCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 17/11/2023.
//

import UIKit

class SideBarCollectionViewCell: UICollectionViewCell {
    
    let profileIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var createSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.gray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return separatorView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileIcon, profileLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 40
        stack.alignment = .leading
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with sideBar: SideBarItemData) {
        profileIcon.image = UIImage(named: sideBar.iconLabel)
        profileLabel.text = sideBar.label
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
