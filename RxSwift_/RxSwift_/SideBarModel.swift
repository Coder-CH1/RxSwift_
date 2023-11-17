//
//  SideBarModel.swift
//  RxSwift_
//
//  Created by Mac on 17/11/2023.
//

import UIKit

struct Profile {
    var profileImage: UIImage?
    var profileName: String
    //    var viewProfile: String
}


struct Orders {
    var ordersIcon: UIImage?
    var ordersLabel: String
}


struct Offer {
    var offerIcon: UIImage?
    var offerLabel: String
}


struct Privacy {
    var privacyIcon: UIImage?
    var privacyLabel: String
}


struct Security {
    var securityIcon: UIImage?
    var securityLabel: String
}

struct SidebarItem {
    enum ItemType {
        case profile(Profile)
        case orders(Orders)
        case offer(Offer)
        case  privacy(Privacy)
        case security(Security)
    }
    
    let type: ItemType
}

let profileItem = SidebarItem(type: .profile(Profile(profileImage: UIImage(named: ""), profileName: "")))

let ordersItem = SidebarItem(type: .orders(Orders(ordersIcon: UIImage(named: ""), ordersLabel: "")))

let offerItem = SidebarItem(type: .offer(Offer(offerIcon: UIImage(named: ""), offerLabel: "")))

let privacyItem = SidebarItem(type: .privacy(Privacy(privacyIcon: UIImage(named: ""), privacyLabel: "")))

let securityItem = SidebarItem(type: .security(Security(securityIcon: UIImage(named: ""), securityLabel: "")))
