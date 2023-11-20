//
//  SideBarModel.swift
//  RxSwift_
//
//  Created by Mac on 17/11/2023.
//

import Foundation

enum SideBarItems: String, CaseIterable {
    case profile
    case orders
    case offer
    case privacy
    case security
}

let sideBarImages: [SideBarItems: String] = [
    .profile: "profile",
    .orders: "order",
    .offer: "offer",
    .privacy: "privacy",
    .security: "security"
]

struct SideBarItemData {
    let item: SideBarItems
    let iconLabel: String
    let label: String
}
