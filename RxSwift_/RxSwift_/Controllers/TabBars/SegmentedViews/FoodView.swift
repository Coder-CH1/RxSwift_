//
//  FoodView.swift
//  RxSwift_
//
//  Created by Mac on 16/11/2023.
//

import UIKit

class FoodView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
