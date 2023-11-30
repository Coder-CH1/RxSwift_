//
//  LoginView.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class LoginView: UIView {
    
    var delegate: LoginViewControllerDelegate?
    
    let loginEmailLabel = Label(label: "Email address", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let loginEmailTextField = CustomTextField(placeholder: "", isSecureTextEntry: false)
    
    let emailView = CustomTextFieldView(color: .black)
    
    let loginPasswordLabel = Label(label: "Password", textColor: #colorLiteral(red: 0.6677635312, green: 0.6680963635, blue: 0.6783171296, alpha: 1), font: UIFont.systemFont(ofSize: 12, weight: .regular))
    
    let loginPasswordTextField = CustomTextField(placeholder: "", isSecureTextEntry: true)
    
    let passwordView = CustomTextFieldView(color: .black)
    
    let forgotPassCodeButton = Button(image: UIImage(named: ""), label: "Forgot passcode?", btnTitleColor: #colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear, font: UIFont())
    
    let loginButton = Button(image: UIImage(named: ""), label: "Login", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1), radius: 30, imageColor: .clear, font: UIFont())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        setupViews()
        setupSideBarButtonAction()
    }
    
    
    func setupViews() {
        let subviews = [loginButton, loginEmailLabel, loginEmailTextField, emailView, loginPasswordLabel, loginPasswordTextField, passwordView, forgotPassCodeButton]
        for subview in subviews {
            self.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            loginEmailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            loginEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            loginEmailTextField.topAnchor.constraint(equalTo: loginEmailLabel.bottomAnchor, constant: 10),
            loginEmailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loginEmailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailView.topAnchor.constraint(equalTo: loginEmailTextField.bottomAnchor, constant: 8),
            emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            loginPasswordLabel.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 50),
            loginPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            loginPasswordTextField.topAnchor.constraint(equalTo: loginPasswordLabel.bottomAnchor, constant: 10),
            loginPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loginPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            passwordView.topAnchor.constraint(equalTo: loginPasswordTextField.bottomAnchor, constant: 8),
            passwordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            forgotPassCodeButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 50),
            forgotPassCodeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func setupSideBarButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.loginButtonTapped()
        }
        loginButton.addAction(action, for: .primaryActionTriggered)
    }
    
    func loginButtonTapped() {
        delegate?.customViewDidPresentVC()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

