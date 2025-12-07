//
//  MenuViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import Foundation

class MenuViewModel: ObservableObject{
    @Published var items: [MenuModel] = []
    @Published var searchText: String = ""
    
    init(){
        loadMenu()

    }
    
    var filteredItems: [MenuModel]{
        if searchText.isEmpty{
            return items
        }else {
            return items.filter{
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
   
    
    func loadMenu(){
        items = [
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000001") ?? UUID(), imageName: "Burger", name: "Burger Hot", originalPrice: 12.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000002") ?? UUID(), imageName: "Delicious Pizza", name: "Delicious Pizza", originalPrice: 15.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000003") ?? UUID(), imageName: "Mix Pizza", name: "Mix Pizza Italiano", originalPrice: 21.59, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000004") ?? UUID(), imageName: "Double CheeseBurger", name: "Double Cheeseburger", originalPrice: 11.49, discountedPrice: 7.99, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000005") ?? UUID(), imageName: "KFC mix Menu", name: "KFC Mix", originalPrice: 23.99, discountedPrice: 20.99, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000006") ?? UUID(), imageName: "Food Egg", name: "Egg", originalPrice: 2.59, discountedPrice: 1.89, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000007") ?? UUID(), imageName: "Food Vegeterian", name: "Vegeterian", originalPrice: 6.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000008") ?? UUID(), imageName: "Spiral Rotatouille", name: "Spiral Rotatouille", originalPrice: 14.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000009") ?? UUID(), imageName: "Cheesy Italian Stromboli", name: "Cheesy Italian Stromboli", originalPrice: 21.99, discountedPrice: nil, amount: 0, category: .food),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000010") ?? UUID(), imageName: "Bucatrini Amatricana", name: "Bucatrini Amatricana", originalPrice: 9.99, discountedPrice: 8.99, amount: 0, category: .food),
            
            
            
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000011") ?? UUID(), imageName: "Strawberry Mojito", name: "Strawberry Mojito", originalPrice: 4.99, discountedPrice: 2.89, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000012") ?? UUID(), imageName: "Watermelon Mojito", name: "Watermelon Mojito", originalPrice: 5.59, discountedPrice: 3.39, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000013") ?? UUID(), imageName: "Cola Classic", name: "Coca-Cola Classic 0.33 ml", originalPrice: 0.5, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000014") ?? UUID(), imageName: "Cola Zero", name: "Coca-Cola Zero 0.33 ml", originalPrice: 0.88, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000015") ?? UUID(), imageName: "Fanta Classic", name: "Fanta Classic 0.33 ml", originalPrice: 0.88, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000016") ?? UUID(), imageName: "Fanta Lemon", name: "Fanta Lemon 0.33 ml", originalPrice: 0.6, discountedPrice: nil, amount: 0, category: .drinks),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000017") ?? UUID(), imageName: "Fanta Grape", name: "Fanta Grape", originalPrice: 0.79, discountedPrice: nil, amount: 0, category: .drinks),
            
            
            
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000018") ?? UUID(), imageName: "Gaillac Wine", name: "Gaillac", originalPrice: 299, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000019") ?? UUID(), imageName: "Le Tour Wine", name: "Le Tour", originalPrice: 279, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000020") ?? UUID(), imageName: "Toi Toi Wine", name: "Toi-Toi", originalPrice: 499, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000021") ?? UUID(), imageName: "La Bastide Blanche Wine", name: "La Bastide Blanche", originalPrice: 799, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000022") ?? UUID(), imageName: "Kirrihill Wine", name: "Kirrihill", originalPrice: 99.99, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000023") ?? UUID(), imageName: "Moscati Wine", name: "Moscato D'Asti", originalPrice: 3099, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000024") ?? UUID(), imageName: "Sonoma-Cutrer Rose Wine", name: "Sonoma-Cutrer Rose", originalPrice: 689.99, discountedPrice: nil, amount: 0, category: .wines),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000025") ?? UUID(), imageName: "Stone Hill Rose Wine", name: "Stone Hill Rose", originalPrice: 559.19, discountedPrice: nil, amount: 0, category: .wines),
            
            
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000026") ?? UUID(), imageName: "Whisky Black & White", name: "Black & White", originalPrice: 999, discountedPrice: 699, amount: 0, category: .whiskies),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000027") ?? UUID(), imageName: "Whisky Black Label", name: "Black Label", originalPrice: 1299, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000028") ?? UUID(), imageName: "Whisky Buchanan's Deluxe", name: "Buchanan's Deluxe", originalPrice: 899, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000029") ?? UUID(), imageName: "Whisky Chivas Royal Salute", name: "Chivas Royal Salute", originalPrice: 2099, discountedPrice: 1799, amount: 0, category: .whiskies),
            MenuModel(id: UUID(uuidString: "00000000-0000-0000-0000-000000000030") ?? UUID(), imageName: "Whisky Chivas Regal", name: "Chivas Regal", originalPrice: 499, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000031") ?? UUID(), imageName: "Whisky Grand Old Parr", name: "Grand Old Parr", originalPrice: 799, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000032") ?? UUID(), imageName: "Whisky Jack Daniel's Apple", name: "Jack Daniel's Apple", originalPrice: 1599, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000033") ?? UUID(), imageName: "Whisky Old Parr", name: "Old Parr", originalPrice: 299, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000034") ?? UUID(), imageName: "Whisky Red Label", name: "Red Label", originalPrice: 99, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000035") ?? UUID(), imageName: "Whisky Passport", name: "Passport", originalPrice: 579, discountedPrice: nil, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000036") ?? UUID(), imageName: "Whisky Something Special", name: "Something Special", originalPrice: 479, discountedPrice: 289, amount: 0, category: .whiskies),
            MenuModel(id:  UUID(uuidString: "00000000-0000-0000-0000-000000000037") ?? UUID(), imageName: "Whisky White Horse", name: "White Horse", originalPrice: 781, discountedPrice: nil, amount: 0, category: .whiskies),

        ]
    }
    
    func addItem(_ item: MenuModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index].amount += 1
        } else {
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
