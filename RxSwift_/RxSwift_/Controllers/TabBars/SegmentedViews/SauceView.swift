//
//  SauceView.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

class SauceView: UIView {
    
    let label = Label(label: "SauceView", textColor: .black, font: UIFont.systemFont(ofSize: 21, weight: .semibold))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
