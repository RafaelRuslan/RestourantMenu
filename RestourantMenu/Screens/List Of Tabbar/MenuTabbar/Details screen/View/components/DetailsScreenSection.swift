//
//  DetailsScreenSection.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 21.12.25.
//

import SwiftUI

struct DetailsScreenSection: View {
    
    let item: MenuModel
    
    @Binding var showZoomImage: Bool
    
    @Binding var navigateToOrder: Bool
    
    @Binding var showOrderButton: Bool
    
    var addToOrder: (_ item: MenuModel) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .onTapGesture {
                    showZoomImage = true
                }
                .fullScreenCover(isPresented: $showZoomImage) {
                    ZoomImageScreen(imageName: item.imageName)
                    
                }
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
                
                if showOrderButton{
                    Button{
                        addToOrder(item)
                        navigateToOrder = true
                    }label: {
                        Text("+ Buy")
                            .foregroundStyle(.colorWhite)
                    }
                    .background(
                        Color.colorRedOpacity
                            .roundedCorners(cornerRadius: 12)
                            .frame(width: 65, height: 25)
                    )
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
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.colorBlack)
            }
        }
    }
}

//#Preview {
//    DetailsScreenSection()
//}
