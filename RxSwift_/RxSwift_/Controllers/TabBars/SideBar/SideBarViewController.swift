//
//  SideBarViewController.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class SideBarViewController: UIViewController {
    
    weak var delegate: SidebarViewControllerDelegate?
    
    let toggleBackButton = Button(image: UIImage(systemName: "xmark"), label: "", btnTitleColor: .clear, backgroundColor: .clear, radius: 0, imageColor: .gray)
    
    let signoutButton = Button(image: UIImage(systemName: ""), label: "Sign-out?", btnTitleColor: .white, backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    lazy var sidebarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.register(SideBarCollectionViewCell.self, forCellWithReuseIdentifier: "SideBarCollectionViewCell")
        return collectionView
    }()
    
    let sideBarItemsData: [SideBarItemData] = SideBarItems.allCases.map {
        SideBarItemData(item: $0, imageName: sideBarImages[$0] ?? "", label: $0.rawValue.capitalized)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        setupViews()
    }
}

extension SideBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideBarItemsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideBarCollectionViewCell", for: indexPath) as! SideBarCollectionViewCell
        let optionData = sideBarItemsData[indexPath.item]
        
        cell.profileIcon.image = UIImage(named: optionData.imageName)
        cell.profileLabel.text = optionData.label
        return cell
    }
}

extension SideBarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            navigateToProfileViewController()
        case 1:
            navigateToOrdersViewController()
        case 2:
            navigateToOfferViewController()
        case 3:
            navigateToPrivacyViewController()
        case 4:
            navigateToSecurityViewController()
        default:
            break
        }
    }
}

extension SideBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension SideBarViewController {
    
    func setupViews() {
        view.addSubview(toggleBackButton)
        view.addSubview(sidebarCollectionView)
        view.addSubview(signoutButton)
        toggleBackButton.addTarget(self, action: #selector(toggleBackButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            toggleBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            toggleBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            toggleBackButton.heightAnchor.constraint(equalToConstant: 40),
            toggleBackButton.widthAnchor.constraint(equalToConstant: 40),
            
            sidebarCollectionView.topAnchor.constraint(equalTo: toggleBackButton.bottomAnchor, constant: 20),
            sidebarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            sidebarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            sidebarCollectionView.bottomAnchor.constraint(equalTo: signoutButton.bottomAnchor, constant: -100),
            
            signoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            signoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ])
    }
    
    @objc func toggleBackButtonTapped() {
        delegate?.sideBarDidToggleBack()
    }
}

extension SideBarViewController {
    
    func navigateToProfileViewController() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToOrdersViewController() {
        let vc = OrdersViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToOfferViewController() {
        let vc = OfferViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToPrivacyViewController() {
        let vc = PrivacyViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToSecurityViewController() {
        let vc = SecurityViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
