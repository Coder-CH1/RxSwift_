//
//  Label.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class Label: UILabel {
    
    init(label: String, textColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 10
        self.text = label
        self.textColor = textColor
        self.textAlignment = .center
        self.lineBreakMode = .byWordWrapping
        self.font = font
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
