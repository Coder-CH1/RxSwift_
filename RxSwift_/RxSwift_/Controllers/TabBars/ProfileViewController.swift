//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.layer.cornerRadius = 25
        return image
    }()
    
    let profileName = Label(label: "John doe", textColor: .black, font: UIFont.systemFont(ofSize: 17, weight: .medium))
    
    let profileEmail = Label(label: "johndoe@gmail.com", textColor: .gray, font: UIFont.systemFont(ofSize: 10, weight: .regular))
    
    let profilePhone = Label(label: "+23480", textColor: .gray, font: UIFont.systemFont(ofSize: 10, weight: .regular))
    
    let profileAddress = Label(label: "No 16 john doe street", textColor: .gray, font: UIFont.systemFont(ofSize: 10, weight: .regular))
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileName, profileEmail, profilePhone, profileAddress])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    lazy var profileStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImage, stackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 1
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 8
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .gray
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(profileStackView)
        NSLayoutConstraint.activate([
            profileStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            profileStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
