//
//  HistoryView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 27.07.25.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \SwiftDataModel.date, order: .reverse) var orders: [SwiftDataModel]
    var body: some View {
        List{
            ForEach(orders){ order in
                HStack(spacing: 10) {
                    Image(order.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    VStack(alignment: .leading, spacing: 5){
                            Text(order.name)
                                .font(.headline)
                        HStack(alignment: .center, spacing: 12){
                            Text("Price: \((order.originalPrice), format: .currency(code: "USD"))")
                                .italic()
                                .bold()
                            Text("x\(order.amount)")
                                .font(.title2)
                                .foregroundStyle(Color.blue)
                                .bold()
                        }
                        HStack(alignment: .top, spacing: 10) {
                            
                            Text(order.date, style: .date)
                                .font(.title2)
                                .bold()
                            Text(order.date, style: .time)
                                .font(.title2)
                                .bold()
                        }
                    }
                }
                .padding(.vertical, 6)
            }
            .onDelete(perform: deleteItems)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("History")
                    .font(.title)
                    .bold()
            }
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                }label:{
                    Image(systemName: "chevron.left")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
        
    private func deleteItems(at offsets: IndexSet){
        for index in offsets{
            let orderDelete = orders[index]
            modelContext.delete(orderDelete)
        }
        do{
            try? modelContext.save()
        }catch{
            print("Error, no deleted")
        }
    }
}
