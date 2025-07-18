//
//  HomeView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//

import SwiftUI

struct HomeView: View {
    
var body: some View {
       
        ZStack{
            RadialGradient(colors: [.mint, .white], center: .top, startRadius: 20, endRadius: 600)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("👋")
                    Text("Ruslan!")
                        .bold()
                }
                .font(.system(size: 34))
                .padding(.top, 60)
                .padding(.horizontal, 20)
                
                Spacer()
                
                Text("Welcome !")
                    .font(.system(size: 40))
                    .italic()
                    .bold()
            }
        }
    }
}

#Preview {
    HomeView()
}
