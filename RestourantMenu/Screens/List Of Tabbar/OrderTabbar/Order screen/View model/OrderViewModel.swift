//
//  OrderViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 12.07.25.
//

import SwiftData
import SwiftUI

@Observable
class OrderViewModel: ObservableObject {
    var selectedItems: [MenuModel] = []
    
    var orderItem: [SwiftDataModel] = []
    
    var totalSpent = 0.0
    
    var language = "az"
    
    var total: Double = 0
    
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
            orderItem.append(expense)
        }
        do {
            try modelContext.save()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    func deleteOrder(_ order: SwiftDataModel, modelContext: ModelContext) {
           if let index = orderItem.firstIndex(where: { $0.id == order.id }) {
               orderItem.remove(at: index)
           }
           if let selectedIndex = selectedItems.firstIndex(where: { $0.id == order.id }) {
               selectedItems.remove(at: selectedIndex)
           }
           modelContext.delete(order)
           try? modelContext.save()
       }
       
       func deleteItems(at offsets: IndexSet) {
           selectedItems.remove(atOffsets: offsets)
       }
    
    func cleanOrder() {
        selectedItems.removeAll()
    }
}
