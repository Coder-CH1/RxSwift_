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

    var selectedIndex: Int?

    var foodView = FoodView()

    var drinksView = DrinksView()

    var snacksView = DrinksView()

    var sauceView = SauceView()

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
        for (index, button) in buttons.enumerated() {
            button.isSelected = (button == sender)

        }
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

//class CustomSegmentedControl: UIStackView {
//
//    var buttons = [UIButton]()
//    let segmentsTitle = ["Food", "Drinks", "Snacks", "Sauce"]
//    var selectedIndex: Int?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupStackView()
//    }
//
//    private func setupStackView() {
//        axis = .horizontal
//        distribution = .fillEqually
//        spacing = 50
//
//        for (index, title) in segmentsTitle.enumerated() {
//            let button = UIButton()
//            button.tag = index
//            button.setTitle("\(title)", for: .normal)
//            button.setTitleColor(.gray, for: .normal)
//            button.setTitleColor(#colorLiteral(red: 0.9940347075, green: 0.3827575445, blue: 0.02892503142, alpha: 1), for: .selected)
//            button.addTarget(self, action: #selector(segmentTapped(_:)), for: .touchUpInside)
//            button.setBackgroundImage(UIImage(systemName: ""), for: .selected)
//            buttons.append(button)
//            addArrangedSubview(button)
//        }
//    }
//
//    @objc func segmentTapped(_ sender: UIButton) {
//        guard let index = buttons.firstIndex(of: sender) else { return }
//
//        selectedIndex = index
//
//        switch index {
//        case 0:
//            showView(foodView)
//        case 1:
//            showView(drinksView)
//        case 2:
//            showView(snacksView)
//        case 3:
//            showView(sauceView)
//        default:
//            break
//        }
//
//        for (i, button) in buttons.enumerated() {
//            button.isSelected = (i == selectedIndex)
//        }
//    }
//
//    func showView(_ view: UIView) {
//        foodView.isHidden = (view != foodView)
//        drinksView.isHidden = (view != drinksView)
//        snacksView.isHidden = (view != snacksView)
//        sauceView.isHidden = (view != sauceView)
//    }
//
////    func setupViews() {
////        self.addSubview(foodView)
////        self.addSubview(drinksView)
////        self.addSubview(snacksView)
////        self.addSubview(sauceView)
////        NSLayoutConstraint.activate([
////            foodView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
////            foodView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            foodView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
////            foodView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
////
////            drinksView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
////            drinksView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            drinksView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
////            drinksView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
////
////            snacksView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
////            snacksView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            snacksView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
////            snacksView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
////
////            sauceView.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
////            sauceView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            sauceView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
////            sauceView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
////        ])
////    }
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        setupStackView()
//    }
//}
