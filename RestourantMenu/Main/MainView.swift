//
//  MainView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 10.07.25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var orderViewModel = OrderViewModel()
    @Environment(\.modelContext) var context
    @State private var index = 0
    var body: some View {
            TabView(selection: $index){
                HomeView()
                    .tag(0)
                    .tabItem{
                        Label("Home",
                              systemImage: "house.fill"
                        )
                    }
                MenuView()
                    .tag(1)
                    .environmentObject(orderViewModel)
                    .tabItem {
                        Label("Menu",
                              systemImage: "menucard"
                        )
                        
                    }
                SearchView()
                    .tag(2)
                    .environmentObject(orderViewModel)
                    .tabItem {
                        Label("Search",
                              systemImage: "magnifyingglass"
                        )
                    }
                OrderView()
                    .tag(3)
                    .environmentObject(orderViewModel)
                    .tabItem {
                        Label("Order",
                              systemImage: "cart.fill.badge.plus"
                        )
                    }
                AccountView()
                    .tag(4)
                    .tabItem {
                        Label("Account",
                              systemImage: "person.circle.fill"
                        )
                    }
            }
    }
}

#Preview {
    MainView()
        .environmentObject(OrderViewModel())
}
