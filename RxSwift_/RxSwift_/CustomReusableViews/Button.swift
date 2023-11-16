//
//  Button.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class Button: UIButton {
    
    init(image: UIImage?,label: String, btnTitleColor: UIColor, backgroundColor: UIColor, radius: CGFloat, imageColor: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        self.setImage(image, for: .normal)
        self.setTitle(label, for: .normal)
        self.setTitleColor(btnTitleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = radius
        self.tintColor = imageColor
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
