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
                if viewModel.filteredItems.isEmpty{
                    Text("No results found...")
                }else{
                    ForEach(viewModel.filteredItems){ item in
                        HStack{
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            Text(item.name)
                                .font(.title2)
                                .fontDesign(.serif)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Search")
                        .font(.title)
                        .italic()
                }
                
            }
            .searchable(text: $viewModel.searchText, prompt: "Search menu ...")
        }
    }
}

#Preview {
    SearchView()
}
