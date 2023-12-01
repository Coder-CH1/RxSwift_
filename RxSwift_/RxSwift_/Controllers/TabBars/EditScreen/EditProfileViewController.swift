//
//  EditProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 23/11/2023.
//

import UIKit
//MARK: - Objects properties and its constraints
class EditProfileViewController: UIViewController {
    
    var delegate: EditViewControllerDelegate?
    
    let saveButton = Button(image: UIImage(systemName: ""), label: "save", btnTitleColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
        navigationItem.title = "Edit Profile"
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
