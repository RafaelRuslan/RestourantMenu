//
//  MenuViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import Foundation

class MenuViewModel: ObservableObject{
    @Published var items: [MenuModel] = []
    
    init(){
        loadMenu()

    }
    
    func loadMenu(){
        items = [
            MenuModel(imageName: "Burger", name: "Burger Hot", originalPrice: 12.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Delicious Pizza", name: "Delicious Pizza", originalPrice: 15.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Mix Pizza", name: "Mix Pizza Italiano", originalPrice: 21.59, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Double CheeseBurger", name: "Double Cheeseburger", originalPrice: 11.49, discountedPrice: 7.99, amount: 0, category: .food),
            MenuModel(imageName: "KFC mix Menu", name: "KFC Mix", originalPrice: 23.99, discountedPrice: 20.99, amount: 0, category: .food),
            MenuModel(imageName: "Food Egg", name: "Egg", originalPrice: 2.59, discountedPrice: 1.89, amount: 0, category: .food),
            MenuModel(imageName: "Food Vegeterian", name: "Vegeterian", originalPrice: 6.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Spiral Rotatouille", name: "Spiral Rotatouille", originalPrice: 14.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Cheesy Italian Stromboli", name: "Cheesy Italian Stromboli", originalPrice: 21.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(imageName: "Bucatrini Amatricana", name: "Bucatrini Amatricana", originalPrice: 9.99, discountedPrice: 8.99, amount: 0, category: .food),
            
            
            
            MenuModel(imageName: "Strawberry Mojito", name: "Strawberry Mojito", originalPrice: 4.99, discountedPrice: 2.89, amount: 0, category: .drinks),
            MenuModel(imageName: "Watermelon Mojito", name: "Watermelon Mojito", originalPrice: 5.59, discountedPrice: 3.39, amount: 0, category: .drinks),
            MenuModel(imageName: "Cola Classic", name: "Coca-Cola Classic 0.33 ml", originalPrice: 0.5, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(imageName: "Cola Zero", name: "Coca-Cola Zero 0.33 ml", originalPrice: 0.88, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(imageName: "Fanta Classic", name: "Fanta Classic 0.33 ml", originalPrice: 0.88, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(imageName: "Fanta Lemon", name: "Fanta Lemon 0.33 ml", originalPrice: 0.6, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(imageName: "Fanta Grape", name: "Fanta Grape", originalPrice: 0.79, discountedPrice: nil, amount: 0, category: .drinks),
            
            
            
            MenuModel(imageName: "Gaillac Wine", name: "Gaillac", originalPrice: 299, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Le Tour Wine", name: "Le Tour", originalPrice: 279, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Toi Toi Wine", name: "Toi-Toi", originalPrice: 499, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "La Bastide Blanche Wine", name: "La Bastide Blanche", originalPrice: 799, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Kirrihill Wine", name: "Kirrihill", originalPrice: 99.99, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Moscati Wine", name: "Moscato D'Asti", originalPrice: 3099, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Sonoma-Cutrer Rose Wine", name: "Sonoma-Cutrer Rose", originalPrice: 689.99, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(imageName: "Stone Hill Rose Wine", name: "Stone Hill Rose", originalPrice: 559.19, discountedPrice: nil, amount: 0, category: .wines),
            
            
            MenuModel(imageName: "Whisky Black & White", name: "Black & White", originalPrice: 999, discountedPrice: 699, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Black Label", name: "Black Label", originalPrice: 1299, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Buchanan's Deluxe", name: "Buchanan's Deluxe", originalPrice: 899, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Chivas Royal Salute", name: "Chivas Royal Salute", originalPrice: 2099, discountedPrice: 1799, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Chivas Regal", name: "Chivas Regal", originalPrice: 499, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Grand Old Parr", name: "Grand Old Parr", originalPrice: 799, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Jack Daniel's Apple", name: "Jack Daniel's Apple", originalPrice: 1599, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Old Parr", name: "Old Parr", originalPrice: 299, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Red Label", name: "Red Label", originalPrice: 99, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Passport", name: "Passport", originalPrice: 579, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky Something Special", name: "Something Special", originalPrice: 479, discountedPrice: 289, amount: 0, category: .whiskies),
            MenuModel(imageName: "Whisky White Horse", name: "White Horse", originalPrice: 781, discountedPrice: nil, amount: 0, category: .whiskies),

        ]
    }
    
    func addItem(_ item: MenuModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index].amount += 1
            
        }else{
            var newItem = item
            newItem.amount = 1
            items.append(newItem)
        }
    }
    
    func increment(for item: MenuModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index].amount += 1
            items = items
        }
    }
    
    func decrement(for item: MenuModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            if items[index].amount > 0 {
                items[index].amount -= 1
                items = items
            }
        }
    }
    var total: Double{
        items.reduce(0) { result, item in
            let price = item.discountedPrice ?? item.originalPrice
            return result + price * Double(item.amount)
            
        }
    }
}
