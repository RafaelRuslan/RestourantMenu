//
//  Localizer.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 30.07.25.
//

import Foundation
import SwiftUI

class Localizer: ObservableObject{
    static let shared = Localizer()
    
    @Published var selectedLanguage: String{
        didSet{
            UserDefaults.standard.set(selectedLanguage, forKey: "AppLanguage")
            loadBundle()
        }
        
    }
    var bundle: Bundle = .main
    
    private init(){
        selectedLanguage = UserDefaults.standard.string(forKey: "AppLanguage") ?? Locale.current.language.languageCode?.identifier ?? "en"
        loadBundle()
    }
    
    private func loadBundle(){
        if let path = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"),
           let newBundle = Bundle(path: path){
            bundle = newBundle
        }else{
            bundle = .main
        }
    }
    func localizedString(forKey key: String) -> String{
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }
}
