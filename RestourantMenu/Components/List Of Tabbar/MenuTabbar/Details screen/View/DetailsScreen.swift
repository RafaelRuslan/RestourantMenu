//
//  DetailsScreen.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.12.25.
//

import SwiftUI

struct DetailsScreen: View {
    
    var item: MenuModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                HStack(spacing: 15){
                    Text(item.name)
                        .fontModifier(size: 15, weight: .semibold, foregroundColor: .colorBlack)
                        .lineLimit(1)
                    if let discountedPrice = item.discountedPrice{
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            .priceModify()
                            .lineLimit(1)
                        Text("\(discountedPrice, format: .currency(code: "USD"))")
                            .fontModifier(size: 15, weight: .semibold, foregroundColor: .colorBlack)
                            .lineLimit(1)
                    }else{
                        Text("\(item.originalPrice, format: .currency(code: "USD"))")
                            
                            .fontModifier(size: 15, weight: .semibold, foregroundColor: .colorBlack)
                            .lineLimit(1)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden()
            .toolbar {
                toolbar
            }
        }
    }
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label:{
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

//#Preview {
//    DetailsScreen()
//}
