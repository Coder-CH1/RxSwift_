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
        layout.minimumLineSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SideBarCollectionViewCell.self, forCellWithReuseIdentifier: "SideBarCollectionViewCell")
        return collectionView
    }()
    
    var sideBarData: [SidebarItem] = [profileItem,
                                    ordersItem,
                                    offerItem,
                                    privacyItem,
                                    securityItem] {
        didSet {
            sidebarCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
        setupViews()
    }
}

extension SideBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideBarData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideBarCollectionViewCell", for: indexPath) as! SideBarCollectionViewCell
        let item = sideBarData[indexPath.item]
        switch item.type {
        case .profile(let profileItem):
            cell.privacyIcon.image = profileItem.profileIcon
            cell.profileLabel.text = profileItem.profileLabel
        case .orders(let ordersItem):
            cell.ordersIcon.image = ordersItem.ordersIcon
            cell.ordersLabel.text = ordersItem.ordersLabel
        case .offer(let offerItem):
            cell.offerIcon.image = offerItem.offerIcon
            cell.offerLabel.text = offerItem.offerLabel
        case .privacy(let privacyItem):
            cell.privacyIcon.image = privacyItem.privacyIcon
            cell.privacyLabel.text = privacyItem.privacyLabel
        case .security(let securityItem):
            cell.securityIcon.image = securityItem.securityIcon
            cell.securityLabel.text = securityItem.securityLabel
        }
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
        return CGSize(width: view.frame.width, height: 40)
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
            
            sidebarCollectionView.topAnchor.constraint(equalTo: toggleBackButton.bottomAnchor, constant: 80),
            sidebarCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sidebarCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sidebarCollectionView.bottomAnchor.constraint(equalTo: signoutButton.bottomAnchor, constant: -50),
            
            signoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
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
