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
    
    @State private var showZoomImage = false
    
    @StateObject private var vm = DetailsViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    @State var showOrderButton = false
    
    var body: some View {
        
        ScrollView{
            DetailsScreenSection(
                item: item,
                showZoomImage: $showZoomImage,
                navigateToOrder: $vm.navigateToOrder,
                showOrderButton: $showOrderButton,
                addToOrder: { item in order.addToOrder(item)}
            )
        }
        .navigationDestination(isPresented: $vm.navigateToOrder) {
            OrderView(orderVM: order)
        }
    }
}

