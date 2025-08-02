//
//  MenuModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import Foundation
import SwiftUI

enum MenuCategory: String, CaseIterable, Identifiable {
    case food = "FOOD"
    case drinks = "DRINKS"
    case wines = "WINE"
    case whiskies = "WHISKY"

    var id: String { self.rawValue }
}

struct MenuModel: Identifiable, Equatable{
    let id: UUID
    let imageName: String
    let name: String
    let originalPrice: Double
    let discountedPrice: Double?
    var amount: Int
    let category: MenuCategory
    
}
