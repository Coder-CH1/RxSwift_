//
//  CustomTextField.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: String(), size: 18)
        textColor = .black
        autocapitalizationType = .none
        autocorrectionType = .no
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

