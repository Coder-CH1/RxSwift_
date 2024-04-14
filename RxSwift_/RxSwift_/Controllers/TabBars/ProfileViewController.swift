//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 23/11/2023.
//

import UIKit
//MARK: - Objects properties and its constraints
class ProfileViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    let myProfileLabel = Label(label: "My Profile", textColor: .black, font: UIFont.systemFont(ofSize: 30, weight: .semibold))
    
    let personalDetailsLabel = Label(label: "Personal details", textColor: .black, font: UIFont.systemFont(ofSize: 17, weight: .semibold))
    
    let changeButton = Button(image: UIImage(systemName: String()), label: "change", btnTitleColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    lazy var profileView: UIView = {
        let profileView = UIView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .white
        profileView.layer.cornerRadius = 10
        return profileView
    }()
    
    let profileName = Label(label: "John doe", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    var profileEmail = Label(label: "johndoe@gmail.com", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))
    
    var profilePhone = Label(label: "+23480", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))
    
    let profileAddress = Label(label: "No 16 john doe street", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupChangeButtonAction()
        navigationItem.title = "Profile"
    }
    
    func setupChangeButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.changeButtonTapped()
        }
        changeButton.addAction(action, for: .primaryActionTriggered)
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
    
    func changeButtonTapped() {
        let vc = EditProfileViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
