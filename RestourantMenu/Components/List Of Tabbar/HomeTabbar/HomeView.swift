//
//  HomeView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage(.language) private var language = "az"
    
    @EnvironmentObject private var loginVM: LoginViewModel

    var body: some View {
        ZStack{
            RadialGradient(colors: [.mint, .white], center: .top, startRadius: 20, endRadius: 600)
                .ignoresSafeArea()
            VStack(alignment: .center){
                HStack{
                    Image(systemName: "hand.draw.fill")
                        .foregroundStyle(.gray)
                    Text("\(loginVM.name)")
                        .italic()
                        .kerning(2)
                        .bold()
                }
                .font(.system(size: 34))
                .padding()
                
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
