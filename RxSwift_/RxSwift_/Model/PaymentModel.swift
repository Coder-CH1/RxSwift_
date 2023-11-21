//
//  PaymentModel.swift
//  RxSwift_
//
//  Created by Mac on 21/11/2023.
//

import Foundation

enum PaymentOptions: String, CaseIterable {
    case card
    case bankAccount
    case paypal
}

let paymentImages: [PaymentOptions: String] = [
    .card: "card",
    .bankAccount: "bank",
    .paypal: "paypal"
]

struct PaymentItemsData {
    let item: PaymentOptions
    let iconLabel: String
    let label: String
}

