//
//  SearchView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 22.07.25.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationView {
            List{
                    ForEach(viewModel.filteredItems){ item in
                        HStack{
                            Image(item.imageName)
                                .resizable()
                                .searchImage()
                            Text(item.name)
                                .font(.title2)
                                .fontDesign(.serif)
                        }
                    }
                }
            .overlay{
                if viewModel.filteredItems.isEmpty{
                    VStack(spacing: 10){
                        Image(systemName: "person.fill")
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                            .foregroundStyle(.purple)
                        
                        Text("No results found...")
                            .font(.system(size: 22, weight: .medium, design: .rounded))

                    }
                }
            }
            
            .navigationBarBackButtonHidden()
            .toolbar{
                toolbar
            }
            .searchable(text: $viewModel.searchText, prompt: "Search menu ...")
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("Search")
                .font(.title)
                .italic()
        }
    }
}

#Preview {
    SearchView()
}
