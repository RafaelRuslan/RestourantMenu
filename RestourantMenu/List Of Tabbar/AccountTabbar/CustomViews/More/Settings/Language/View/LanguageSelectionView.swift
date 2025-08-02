//
//  LanguageSelectionView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 13.07.25.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var localizer = Localizer.shared
    
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
                LinearGradient(colors: [.white, .yellow], startPoint: .top, endPoint: .trailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    ForEach(languages, id: \.self){ lang in
                        HStack{
                            Text(lang)
                                .foregroundStyle(.black.mix(with: .red, by: 0.4))
                                .font(.title2)
                            
                            Spacer()
                            
                            Image(systemName: localizer.selectedLanguage == lang ? "largecircle.fill.circle" : "circle")
                                .foregroundStyle(.blue)
                                .imageScale(.large)
                                .onTapGesture {
                                    localizer.selectedLanguage = lang
                                }
                        }
                        .padding()
                        
                        .contentShape(Rectangle())
                        .onTapGesture {
                            localizer.selectedLanguage = lang
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
