//
//  PaymentOptionCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 22/11/2023.
//

import UIKit

class PaymentCollectionViewCell: UICollectionViewCell {
    
    let radioButton = Button(image: UIImage(systemName: ""), label: "", btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .lightGray)
    
    lazy var paymentIcon: UIImageView = {
        let paymentIcon = UIImageView()
        paymentIcon.translatesAutoresizingMaskIntoConstraints = false
        paymentIcon.backgroundColor = .lightGray
        return paymentIcon
    }()
    
    let paymentLabel = Label(label: "", textColor: .black, font: UIFont.systemFont(ofSize: 14, weight: .regular))
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [radioButton, paymentIcon, paymentLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
    func configure(with optionInfo: PaymentOptions.OptionInfo) {
        radioButton.setImage(optionInfo.buttonImage, for: .normal)
        paymentIcon.image = UIImage(named: "")
        paymentLabel.text = optionInfo.labelName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
