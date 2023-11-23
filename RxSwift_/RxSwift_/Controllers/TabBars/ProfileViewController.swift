//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 23/11/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myProfileLabel = Label(label: "My Profile", textColor: .black, font: UIFont.systemFont(ofSize: 30, weight: .semibold))
    
    let personalDetailsLabel = Label(label: "Personal details", textColor: .black, font: UIFont.systemFont(ofSize: 17, weight: .semibold))
    
    let changeButton = Button(image: UIImage(systemName: ""), label: "change", btnTitleColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    lazy var profileView: UIView = {
        let profileView = UIView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .white
        profileView.layer.cornerRadius = 10
        return profileView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        navigationItem.title = "Profile"
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(myProfileLabel)
        view.addSubview(profileView)
        view.addSubview(personalDetailsLabel)
        view.addSubview(changeButton)
        
        NSLayoutConstraint.activate([
            myProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            myProfileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            
            personalDetailsLabel.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor, constant: 20),
            personalDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            changeButton.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor, constant: 15),
            changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            profileView.topAnchor.constraint(equalTo: personalDetailsLabel.bottomAnchor, constant: 5),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            profileView.heightAnchor.constraint(equalToConstant: 197),
        ])
    }
}
