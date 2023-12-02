//
//  SauceView.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

class SauceView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: SeeMoreDelegate?
   
    let seeMoreButton = Button(image: UIImage(systemName: ""), label: "see more", btnTitleColor: #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), backgroundColor: .clear, radius: 0, imageColor: .clear)
    
    lazy var sauceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 300.0, height: 150.0)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(SauceViewCollectionViewCell.self, forCellWithReuseIdentifier: "SauceViewCollectionViewCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(seeMoreButton)
        addSubview(sauceCollectionView)
        NSLayoutConstraint.activate([
            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            seeMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sauceCollectionView.topAnchor.constraint(equalTo: seeMoreButton.bottomAnchor, constant: 10),
            sauceCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            sauceCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            sauceCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SauceViewCollectionViewCell", for: indexPath) as! SauceViewCollectionViewCell
        cell.backgroundColor = .gray
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
