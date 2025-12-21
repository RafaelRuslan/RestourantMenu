//
//  DetailsScreen.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 18.12.25.
//

import SwiftUI

struct DetailsScreen: View {
    
    var item: MenuModel
    
    let order: OrderViewModel
    
    @State var showOrderButton = false

   @State private var showZoomImage = false
    
    @StateObject private var vm = DetailsViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView{
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
                            order.addToOrder(item)
                            vm.navigateToOrder = true
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
        .navigationDestination(isPresented: $vm.navigateToOrder) {
            OrderView(orderVM: order)
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
