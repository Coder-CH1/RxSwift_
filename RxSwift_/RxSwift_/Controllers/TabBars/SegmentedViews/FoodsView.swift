//
//  FoodView.swift
//  RxSwift_
//
//  Created by Mac on 27/11/2023.
//

import UIKit
//MARK: - FoodsView property objects and constraints
class FoodsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var delegate: SeeMoreFoodsDelegate?
    
    let seeMoreButton = UIButton()
   
    lazy var foodsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 150.0, height: 200.0)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(FoodsViewCollectionViewCell.self, forCellWithReuseIdentifier: "FoodsViewCollectionViewCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureButton()
        setupSeeMoreButtonAction()
    }
    
    func configureButton() {
        seeMoreButton.setTitle("see more", for: .normal)
        seeMoreButton.setTitleColor(#colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1), for: .normal)
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    }
    
    func setupViews() {
        addSubview(seeMoreButton)
        addSubview(foodsCollectionView)
        NSLayoutConstraint.activate([
            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            seeMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            foodsCollectionView.topAnchor.constraint(equalTo: seeMoreButton.bottomAnchor, constant: 5),
            foodsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            foodsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            foodsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    //MARK: - CollectionView Protocol Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodsViewCollectionViewCell", for: indexPath) as! FoodsViewCollectionViewCell
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectFoodsItem(at: indexPath.item)
    }
    
    //MARK: - Button tap to navigate to another screen
    func setupSeeMoreButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.seeMoreButtonTapped()
        }
        seeMoreButton.addAction(action, for: .primaryActionTriggered)
    }
    
    func seeMoreButtonTapped() {
        delegate?.seeMoreFoodsButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
