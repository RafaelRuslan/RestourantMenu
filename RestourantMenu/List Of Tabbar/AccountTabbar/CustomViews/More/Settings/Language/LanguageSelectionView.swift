//
//  LanguageSelectionView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "Azerbaijan"
    
    let languages = [
        "Azerbaijani",
        "Turkish",
        "Russian",
        "English",
        "French",
        "German",
        "Portuguese",
        "Danish",
        "Chinese Simple",
        "Chinese Mandarine",
        "Polish",
        "Belarusian Rus",
        "Spanish",
        "Brazilian Portuguese",
        "American English"
    ]
    
    var body: some View {
        ScrollView{
            ZStack{
                AngularGradient(colors: [.white, .white], center: .bottomTrailing, angle: .degrees(300))
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    ForEach(languages, id: \.self){ lang in
                        HStack{
                            Text(lang)
                                .foregroundStyle(.black.mix(with: .red, by: 0.4))
                                .font(.title2)
                            
                            Spacer()
                            
                            Image(systemName: selectedLanguage == lang ? "largecircle.fill.circle" : "circle")
                                .foregroundStyle(.blue)
                                .imageScale(.large)
                                .onTapGesture {
                                    selectedLanguage = lang
                                }
                        }
                        .padding()
                        
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedLanguage = lang
                        }
                    }
                    
                }
                
                .padding(.horizontal, 5)
                .padding(.top)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Languages")
                            .bold()
                            .font(.largeTitle)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            dismiss()
                        }label:{
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    LanguageSelectionView()
}
