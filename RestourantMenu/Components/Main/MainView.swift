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
    
    let loginVM: LoginViewModel
    
    init(loginVM: LoginViewModel){
        self.loginVM = loginVM
    }
    
    var body: some View {
            TabView(selection: $index){
                HomeView()
                    .tag(0)
                    .environmentObject(loginVM)
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

#Preview {
    MainView(loginVM: LoginViewModel())
        .environmentObject(OrderViewModel())
        .environmentObject(LoginViewModel())
}
