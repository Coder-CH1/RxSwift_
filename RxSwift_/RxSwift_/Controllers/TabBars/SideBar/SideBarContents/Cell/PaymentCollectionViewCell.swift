//
//  PaymentOptionCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 22/11/2023.
//

import UIKit

//MARK: - Objects properties and Constraints
class PaymentCollectionViewCell: UICollectionViewCell {
    
    let radioButton = Button(image: UIImage(systemName: ""), label: "", btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .lightGray, font: UIFont())
    
    lazy var paymentIcon: UIImageView = {
        let paymentIcon = UIImageView()
        paymentIcon.translatesAutoresizingMaskIntoConstraints = false
        paymentIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        paymentIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        return paymentIcon
    }()
    
    let paymentLabel = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return separatorView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [radioButton, paymentIcon, paymentLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .leading
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        paymentLabel.textAlignment = .left
        setupViews()
    }
    
    func setupViews() {
        addSubview(stackView)
        addSubview(separatorView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    func configure(with optionInfo: PaymentOptions.OptionInfo) {
        radioButton.setImage(optionInfo.buttonImage, for: .normal)
        paymentIcon.image = UIImage(named: optionInfo.imageName)
        paymentLabel.text = optionInfo.labelName
        
        switch optionInfo.item {
        case .card:
            paymentIcon.backgroundColor = .orange
        case .bankAccount:
            paymentIcon.backgroundColor = .systemPink
        case .paypal:
            paymentIcon.backgroundColor = .blue
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
