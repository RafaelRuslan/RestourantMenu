//
//  OrderViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 12.07.25.
//

import SwiftData
import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var selectedItems: [MenuModel] = []
    @Published var totalSpent = 0.0
    
    func addToOrder(_ item: MenuModel) {
        if let index = selectedItems.firstIndex(where: { $0.id == item.id }) {
            selectedItems[index].amount += 1
        } else {
            var newItem = item
            newItem.amount = 1
            selectedItems.append(newItem)
        }
    }
    
    func saveOrder(modelContext: ModelContext) {
        for item in selectedItems {
            let expense = SwiftDataModel(
                id: item.id,
                image: item.imageName,
                name: item.name,
                originalPrice: item.originalPrice,
                discountedPrice: item.discountedPrice,
                amount: item.amount,
                date: .now,
            )
            modelContext.insert(expense)
        }
        do {
            try modelContext.save()
            print("Order is saved")
        } catch {
            print("Memory error: \(error)")
        }
    }

    func deleteItems(at offsets: IndexSet) {
        selectedItems.remove(atOffsets: offsets)
    }

    func cleanOrder() {
        selectedItems.removeAll()
    }

    var total: Double {
        selectedItems.reduce(0) { result, item in
            let price = item.discountedPrice ?? item.originalPrice
            return result + price * Double(item.amount)
        }
    }
}
