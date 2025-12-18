//
//  ContentView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

struct MenuView: View {
//    @EnvironmentObject var orderManager: OrderViewModel
    
    let orderVM: OrderViewModel
    
    init(orderVM: OrderViewModel) {
        self.orderVM = orderVM
    }
    
    @StateObject private var viewModel = MenuViewModel()
    
    @State private var selectedCategory: MenuCategory = .food
    
    @State private var index = 0
    
    @State private var isActive = false
    
    var body: some View {
        
            ZStack{
                VStack{
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            ForEach(MenuCategory.allCases) { category in
                                Text(category.rawValue)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(selectedCategory == category ? Color.colorBlue : Color.colorBlack.opacity(0.5))
                                    .foregroundStyle(.colorWhite)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .onTapGesture{
                                        withAnimation(.interactiveSpring(duration: 1.45)) {
                                            selectedCategory = category
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    
                    Divider()
                        .background(Color.primary)
                    
                    ScrollView {
                        LazyVStack{
                            ForEach(viewModel.items.filter { $0.category == selectedCategory }) { item in
                                
                                MenuItemRowView(orderVM: orderVM, item: item, viewModel: viewModel)
                                    .padding(.horizontal)
                                    .transition(.move(edge: .trailing))
                            }
                        }
                    }
                    .onAppear{
                        viewModel.loadMenu()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        toolbar
                    }
                }
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
//        ToolbarItem(placement: .topBarTrailing) {
//            Button{
//                
//            }label:{
//                Image(systemName: "slider.horizontal.3")
//                    .resizable()
//            }
//        }
        
        ToolbarItem(placement: .principal) {
            Text("Lana Dining & Lounge")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .fontDesign(.serif)
        }

    }
}

//#Preview {
//    MenuView()
//}
