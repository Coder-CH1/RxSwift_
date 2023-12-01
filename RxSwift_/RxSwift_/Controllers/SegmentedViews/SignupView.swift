//
//  SignupView.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class SignupView: UIView {
    
    let nameLabel = Label(label: "Full name", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let nameTextField = CustomTextField(placeholder: "", isSecureTextEntry: false)
    
    let nameView = CustomTextFieldView(color: .black)
    
    let residentialAddressLabel = Label(label: "Residential Address", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let residentialAddressTextField = CustomTextField(placeholder: "", isSecureTextEntry: false)
    
    let residentialAddressView = CustomTextFieldView(color: .black)
    
    let signupEmailLabel = Label(label: "Email address", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 18, weight: .regular))
    
    let signupEmailTextField = CustomTextField(placeholder: "", isSecureTextEntry: false)
    
    let emailView = CustomTextFieldView(color: .black)
    
    let signupPasswordLabel = Label(label: "Password", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let signupPasswordTextField = CustomTextField(placeholder: "", isSecureTextEntry: true)
    
    let passwordView = CustomTextFieldView(color: .black)
    
    let signupButton = Button(image: UIImage(named: ""), label: "Sign-up", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1), radius: 30, imageColor: .clear)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        setupViews()
    }
    
    func setupViews() {
        let subviews = [nameLabel,nameTextField,nameView,residentialAddressLabel,residentialAddressTextField,residentialAddressView,signupButton, signupEmailLabel, signupEmailTextField, emailView, signupPasswordLabel, signupPasswordTextField, passwordView]
        for subview in subviews {
            self.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            nameView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            nameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            residentialAddressLabel.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 20),
            residentialAddressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            residentialAddressTextField.topAnchor.constraint(equalTo: residentialAddressLabel.bottomAnchor, constant: 10),
            residentialAddressTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            residentialAddressTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            residentialAddressView.topAnchor.constraint(equalTo: residentialAddressTextField.bottomAnchor, constant: 8),
            residentialAddressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            residentialAddressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            signupEmailLabel.topAnchor.constraint(equalTo: residentialAddressView.bottomAnchor, constant: 20),
            signupEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            signupEmailTextField.topAnchor.constraint(equalTo: signupEmailLabel.bottomAnchor, constant: 10),
            signupEmailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            signupEmailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailView.topAnchor.constraint(equalTo: signupEmailTextField.bottomAnchor, constant: 8),
            emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            signupPasswordLabel.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 20),
            signupPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            signupPasswordTextField.topAnchor.constraint(equalTo: signupPasswordLabel.bottomAnchor, constant: 10),
            signupPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            signupPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            passwordView.topAnchor.constraint(equalTo: signupPasswordTextField.bottomAnchor, constant: 8),
            passwordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            signupButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            signupButton.heightAnchor.constraint(equalToConstant: 60),
            signupButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            signupButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

