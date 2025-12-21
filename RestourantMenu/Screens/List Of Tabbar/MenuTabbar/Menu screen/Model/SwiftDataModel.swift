//
//  SwiftDataModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 29.07.25.
//

import Foundation
import SwiftData

@Model
class SwiftDataModel{
    @Attribute(.unique) var id: UUID
    var image: String
    var name: String
    var originalPrice: Double
    var discountedPrice: Double?
    var amount: Int
    var date: Date
    
    init(id: UUID, image: String, name: String, originalPrice: Double, discountedPrice: Double? = nil, amount: Int, date: Date) {
        self.id = id
        self.image = image
        self.name = name
        self.originalPrice = originalPrice
        self.discountedPrice = discountedPrice
        self.amount = amount
        self.date = Date()
    }
}
