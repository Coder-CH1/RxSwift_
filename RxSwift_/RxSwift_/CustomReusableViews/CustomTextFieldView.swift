//
//  CustomTextFieldView.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class CustomTextFieldView: UIView {
    
    init(color: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.heightAnchor.constraint(equalToConstant: 0.4).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func draw(_ rect: CGRect) {
    }
}
