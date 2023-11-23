//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 23/11/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let myProfileLabel = Label(label: "My Profile", textColor: .black, font: UIFont.systemFont(ofSize: 30, weight: .semibold))
    
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
        
        NSLayoutConstraint.activate([
            myProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            myProfileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            profileView.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor, constant: 20),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            profileView.heightAnchor.constraint(equalToConstant: 133),
        ])
    }
}
