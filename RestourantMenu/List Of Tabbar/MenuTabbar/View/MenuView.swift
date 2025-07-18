//
//  ContentView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var ordermanager: OrderViewModel
    @StateObject private var viewModel = MenuViewModel()
    @State private var selectedCategory: MenuCategory = .food
    @State private var index = 0
    @State private var isActive = false
    var body: some View {
        NavigationView {
            ZStack{
                AngularGradient(colors: [.orange, .pink], center: .topLeading, angle: .degrees(-90))
                    .ignoresSafeArea()
                VStack{
                        ScrollView(.horizontal) {
                            HStack(spacing: 20) {
                                ForEach(MenuCategory.allCases) { category in
                                    Text(category.rawValue)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(selectedCategory == category ? Color.blue : Color.black.opacity(0.5))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .onTapGesture{
                                            withAnimation(.interactiveSpring(duration: 3.45)) {
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
                    
                    List {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.items.filter { $0.category == selectedCategory }) { item in
                                    MenuItemRowView(item: item, viewModel: viewModel)
                                        .padding(.horizontal)
                                        .transition(.move(edge: .trailing))
                                }
                            }
                        }
                    
                        .listStyle(PlainListStyle())

                        HStack{
                            Text("Total Price:")
                                .font(.headline)
                            Spacer()
                            Text("$\(viewModel.total, specifier: "%.2f")")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                    .onAppear{
                        viewModel.loadMenu()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                       
                        ToolbarItem(placement: .topBarTrailing) {
                            Button{
            
                            }label:{
                                Image(systemName: "slider.horizontal.3")
                                    .resizable()
                            }
                        }
                        
                        ToolbarItem(placement: .principal) {
                            Text("Lana Dining & Lounge")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .fontDesign(.serif)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
