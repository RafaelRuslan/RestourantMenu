//
//  MainView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 10.07.25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MenuViewModel()
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
                .environmentObject(viewModel)
                .tabItem {
                    Label("Menu",
                          systemImage: "menucard"
                    )
                        
                }
            Text("Search")
                .tag(2)
                .tabItem {
                    Label("Search",
                          systemImage: "magnifyingglass"
                    )
                }
            OrderView()
                .tag(3)
                .environmentObject(viewModel)
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
           
        .tabViewStyle(.tabBarOnly)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(OrderViewModel())
}
