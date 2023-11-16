//
//  CustomTopView.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class CustomTopView: UIView {
    
    init(color: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.widthAnchor.constraint(equalToConstant: 500).isActive = true
        self.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
    }
}

