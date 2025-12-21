//
//  ProfileModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import Foundation

struct ProfileModel: Identifiable{
    let id = UUID()
    let icon: String
    var name: String
}
