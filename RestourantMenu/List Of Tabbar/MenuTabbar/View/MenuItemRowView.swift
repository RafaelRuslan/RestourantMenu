//
//  MenuItemRowView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

struct MenuItemRowView: View {
    @EnvironmentObject var orderManager: OrderViewModel
    var item: MenuModel
    @ObservedObject var viewModel: MenuViewModel
   
    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 4){
                Text(item.name)
                    .font(.headline)
                HStack{
                    if let discount = item.discountedPrice {
                        Text("$\(item.originalPrice, specifier: "%.2f")")
                            .strikethrough()
                            .foregroundStyle(.gray)
                        Text("$\(discount, specifier: "%.2f")")
                            .foregroundStyle(.red)
                            .fontWeight(.bold)
                    }else{
                        Text("$\(item.originalPrice, specifier: "%.2f")")
                            .fontWeight(.bold)
                    }
                }
            }
            Spacer()
            
            HStack(spacing: 8) {
                Button{
                    viewModel.decrement(for: item)
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.red)
                }
                Text("\(viewModel.items.first(where: { $0.id == item.id })?.amount ?? 0)")
                        .font(.title2)
                        .foregroundStyle(.black)
                Button(action: {
                    viewModel.increment(for: item)
                    orderManager.addToOrder(item)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.green)
                }
            }
        }
        .padding(.vertical, 6)
        .background{
            Color
                .white.opacity(0.5)
        }
    }
}
