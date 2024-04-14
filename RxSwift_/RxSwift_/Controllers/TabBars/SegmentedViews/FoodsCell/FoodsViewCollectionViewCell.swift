//
//  FoodsCollectionViewCell.swift
//  RxSwift_
//
//  Created by Mac on 28/11/2023.
//

import UIKit

class FoodsViewCollectionViewCell: UICollectionViewCell {
    let img = CustomImageView(image: UIImage(named: String()))
    
    let lbl1 = Label(label: String(), textColor: .black, font: UIFont.systemFont(ofSize: 48, weight: .semibold))
    
    let lbl2 = Label(label: String(), textColor: .systemOrange, font: UIFont.systemFont(ofSize: 48, weight: .semibold))
}
