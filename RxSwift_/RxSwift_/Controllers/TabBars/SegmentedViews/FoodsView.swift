//
//  FoodView.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit
//MARK: - FoodsView property objects and constraints
class FoodsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let foodsLabel = Label(label: "FoodsView", textColor: .black, font: UIFont.systemFont(ofSize: 21, weight: .semibold))
   
    lazy var foodsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 100.0, height: 200.0)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(FoodsCollectionViewCell.self, forCellWithReuseIdentifier: "FoodsCollectionViewCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(foodsLabel)
        addSubview(foodsCollectionView)
        NSLayoutConstraint.activate([
            foodsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            foodsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            foodsCollectionView.topAnchor.constraint(equalTo: foodsLabel.bottomAnchor, constant: 10),
            foodsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            foodsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            foodsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodsCollectionViewCell", for: indexPath) as! FoodsCollectionViewCell
        cell.backgroundColor = .gray
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
