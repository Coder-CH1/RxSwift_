//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let informationLabel = Label(label: "Information", textColor: .black, font: UIFont.systemFont(ofSize: 24, weight: .semibold))
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true
        image.layer.cornerRadius = 35
        return image
    }()
    
    let profileName = Label(label: "John doe", textColor: .black, font: UIFont.systemFont(ofSize: 24, weight: .semibold))
    
    let profileEmail = Label(label: "johndoe@gmail.com", textColor: .gray, font: UIFont.systemFont(ofSize: 16, weight: .regular))
    
    let profilePhone = Label(label: "+23480", textColor: .gray, font: UIFont.systemFont(ofSize: 16, weight: .regular))
    
    let profileAddress = Label(label: "No 16 john doe street", textColor: .gray, font: UIFont.systemFont(ofSize: 16, weight: .regular))
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileName, profileEmail, profilePhone, profileAddress])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
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
        view.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(informationLabel)
        view.addSubview(profileStackView)
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            profileStackView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 10),
            profileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            profileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            profileStackView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
