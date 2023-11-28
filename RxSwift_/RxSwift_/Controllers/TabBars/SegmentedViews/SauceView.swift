//
//  SauceView.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit

class SauceView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    let sauceLabel = Label(label: "SauceView", textColor: .black, font: UIFont.systemFont(ofSize: 21, weight: .semibold))
    
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
        addSubview(sauceLabel)
        addSubview(sauceCollectionView)
        NSLayoutConstraint.activate([
            sauceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            sauceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sauceCollectionView.topAnchor.constraint(equalTo: sauceLabel.bottomAnchor, constant: 10),
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
