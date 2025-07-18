//
//  OrderViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 12.07.25.
//

import Foundation

class OrderViewModel: ObservableObject{
    
    @Published var selectedItems: [MenuModel] = []
    
    func addToOrder(_ item: MenuModel){
        selectedItems.append(item)
    }
    
    func removeFromOrder(_ item: MenuModel){
        if let index = selectedItems.firstIndex(of: item){
            selectedItems.remove(at: index)
        }
    }
    
    func cleanOrder(){
        selectedItems.removeAll()
    }
    
    var total: Double{
        selectedItems.reduce(0) { result, item in
            let price = item.discountedPrice ?? item.originalPrice
            return result + price * Double(item.amount)
            
        }
    }
    
}
