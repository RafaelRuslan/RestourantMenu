//
//  MainView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 10.07.25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    let orderVM: OrderViewModel
    
    @Environment(\.modelContext) var context
    
    @State private var index = 0
            
    let loginVM: LoginViewModel
    
    init(loginVM: LoginViewModel, orderVM: OrderViewModel, profile: ProfileModel){
        self.loginVM = loginVM
        self.orderVM = orderVM

    }
    
    var body: some View {
            TabView(selection: $index){
                HomeView()
                    .tag(0)
                    .tabItem{
                        Label("Home",
                              systemImage: "house.fill"
                        )
                    }
                MenuView(orderVM: orderVM)
                    .tag(1)
                    .tabItem {
                        Label("Menu",
                              systemImage: "menucard"

                        )
                        
                    }
                SearchView(orderVM: orderVM)
                    .tag(2)
                    .tabItem {
                        Label("Search",
                              systemImage: "magnifyingglass"
                        )
                    }
                OrderView(orderVM: orderVM)
                    .tag(3)
                    .tabItem {
                        Label("Order",
                              systemImage: "cart.fill.badge.plus"
                        )
                    }
                AccountView(loginVM: loginVM)
                    .tag(4)
                    .tabItem {
                        Label("Account",
                              systemImage: "person.circle.fill"
                    )
            }
        }
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                loginVM.logoutUser()
            }label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .fontModifier(size: 20, weight: .semibold, foregroundColor: .colorRedOpacity)
            }
        }
    }
}
