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
        let buttonImage: UIImage?
        let imageName: UIImage?
        let labelName: String
    }

    var optionInfo: OptionInfo {
        switch self {
        case .card:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: UIImage(named: "card"), labelName: "Card")
        case .bankAccount:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: UIImage(named: "bank"), labelName: "Bank account")
        case .paypal:
            return OptionInfo(buttonImage: UIImage(systemName: "circle")!, imageName: UIImage(named: "paypal"), labelName: "Paypal")
        }
    }
}
