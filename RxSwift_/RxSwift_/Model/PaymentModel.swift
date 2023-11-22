//
//  PaymentModel.swift
//  RxSwift_
//
//  Created by Mac on 21/11/2023.
//

import UIKit

enum PaymentOptions: String, CaseIterable {
    case card
    case bankAccount
    case paypal
    
    struct OptionInfo {
        let buttonImage: UIImage
        let imageName: String
        let labelName: String
        let item: PaymentOptions
    }
    
    var optionInfo: OptionInfo {
        switch self {
        case .card:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "card", labelName: "Card", item: .card)
        case .bankAccount:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "bank", labelName: "Bank account", item: .bankAccount)
        case .paypal:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: "paypal", labelName: "Paypal", item: .paypal)
        }
    }
}
