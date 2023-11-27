//
//  SegmentedCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 26/11/2023.
//

import UIKit

class SegmentedCollectionViewCell: UICollectionViewCell {
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["Food", "Drinks", "Snacks", "Sauce"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        return segmentedControl
    }()
    
    let foodView = FoodView()
    
    let drinksView = DrinksView()
    
    let snacksView = SnacksView()
    
    let sauceView = SauceView()
}
