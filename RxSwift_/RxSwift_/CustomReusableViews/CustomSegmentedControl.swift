//
//  CustomSegmentedControl.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class CustomSegmentedControl: UIStackView {

    var buttons = [UIButton]()

    let segmentsTitle = [
        "Food",
        "Drinks",
        "Snacks",
        "Sauce"
    ]
    
    let foodView = FoodsView()
    let drinksView = DrinksView()
    let snacksView = SnacksView()
    let sauceView = SauceView()

    var selectedIndex: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }

    func setupStackView() {
        axis = .horizontal
        distribution = .fillEqually
        spacing = 50

        for index in segmentsTitle {
            let button = UIButton()
            button.setTitle("\(index)", for: .normal)
            button.setTitleColor(.gray, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            button.setTitleColor(#colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1), for: .selected)
            button.addTarget(self, action: #selector(segmentTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            addArrangedSubview(button)
        }
    }
    
    @objc func segmentTapped(_ sender: UIButton) {
        for (_, button) in buttons.enumerated() {
            button.isSelected = (button == sender)
        }
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
