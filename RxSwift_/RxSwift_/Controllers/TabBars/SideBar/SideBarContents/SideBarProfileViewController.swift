//
//  ProfileViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit
//MARK: - Objects properties
class SideBarProfileViewController: UIViewController {
    
    let informationLabel = Label(label: "Information", textColor: .black, font: UIFont.systemFont(ofSize: 17, weight: .semibold))
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true
        image.layer.cornerRadius = 35
        return image
    }()
    
    let profileName = Label(label: "John doe", textColor: .black, font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    let profileEmail = Label(label: "johndoe@gmail.com", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))
    
    let profilePhone = Label(label: "+23480", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))
    
    let profileAddress = Label(label: "No 16 john doe street", textColor: .gray, font: UIFont.systemFont(ofSize: 13, weight: .regular))
    
    lazy var profileView: UIView = {
        let profileView = UIView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .white
        profileView.layer.cornerRadius = 10
        return profileView
    }()
    
    let paymentMethodLabel = Label(label: "Payment Method", textColor: .black, font: UIFont.systemFont(ofSize: 17, weight: .semibold))
    
    lazy var paymentOptionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 10
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PaymentCollectionViewCell.self, forCellWithReuseIdentifier: "PaymentCollectionViewCell")
        return collectionView
    }()
    
    let paymentOptionsInfo: [PaymentOptions: PaymentOptions.OptionInfo] = [
        .card: PaymentOptions.OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "card", labelName: "card", item: .card),
        .bankAccount: PaymentOptions.OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "bank", labelName: "Bank account", item: .bankAccount),
        .paypal: PaymentOptions.OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "paypal", labelName: "Paypal", item: .paypal)
    ]
    
    let updateButton = Button(image: UIImage(systemName: ""), label: "Update", btnTitleColor: .white, backgroundColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), radius: 30, imageColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = "Profile"
        view.backgroundColor = #colorLiteral(red: 0.9436392188, green: 0.9436392188, blue: 0.9436392188, alpha: 1)
    }
   
    func setupViews() {
        let subviews = [informationLabel, profileView, profileImage, profileName, profileEmail, profileAddress, paymentMethodLabel, paymentOptionsCollectionView, updateButton]
        for subview in subviews {
            view.addSubview(subview)
        }
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            profileView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 5),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            profileView.heightAnchor.constraint(equalToConstant: 133),
            
            profileImage.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 20),
            profileImage.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 20),
            
            profileName.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 20),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            profileEmail.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            profileEmail.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            profileAddress.topAnchor.constraint(equalTo: profileEmail.bottomAnchor, constant: 10),
            profileAddress.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            
            paymentMethodLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 30),
            paymentMethodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            paymentOptionsCollectionView.topAnchor.constraint(equalTo: paymentMethodLabel.bottomAnchor, constant: 5),
            paymentOptionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            paymentOptionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            paymentOptionsCollectionView.heightAnchor.constraint(equalToConstant: 231),
            
            updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            updateButton.heightAnchor.constraint(equalToConstant: 60),
            updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }
}

//MARK: - CollectionView Datasource
extension SideBarProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentOptionsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentCollectionViewCell", for: indexPath) as! PaymentCollectionViewCell
        let paymentOption = PaymentOptions.allCases[indexPath.item]
        let optionInfo = paymentOptionsInfo[paymentOption]!
        cell.configure(with: optionInfo)
        return cell
    }
}

//MARK: - CollectionView Delegate
extension SideBarProfileViewController: UICollectionViewDelegate {
    
}

//MARK: - CollectionView Delegate Flow layout of the screen
extension SideBarProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 70, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
