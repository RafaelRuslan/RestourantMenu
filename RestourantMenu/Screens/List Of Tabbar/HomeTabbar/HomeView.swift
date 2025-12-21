//
//  HomeView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//

import SwiftUI

struct HomeView: View {
            
    @StateObject private var loginVM = LoginViewModel()

    var body: some View {
        ZStack{
            RadialGradient(colors: [.mint, .white], center: .top, startRadius: 20, endRadius: 600)
                .ignoresSafeArea()
            VStack(alignment: .center){
                HStack{
                    Image(systemName: "hand.draw.fill")
                        .foregroundStyle(.colorAccent)
                        .rotationEffect(.degrees(loginVM.isAnimated ? 10 : -10))
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: loginVM.isAnimated)
                        .onAppear {
                            loginVM.isAnimated = true
                        }
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
