//
//  HelpViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 19.12.25.
//

import Foundation

class HelpViewModel: ObservableObject{
    
    @Published var thisApp = "This app allows you to browse our full restourant menu, view descriptions, and mark your favorite dishes."
    
    @Published var searchApp = "🔍 Search: Use the search bar to find dishes by name or ingredients."
    
    @Published var favApp = "♥️ Favorites: Tap the heart icon to save dishes you love."
    
    @Published var detailsApp = "📦 Details: Tap a dish to view full information."
    
    @Published var connectionProblemApp = "If something isn't working, check your internet connection or contact us."
    
    @Published var mailApp = "https://mail.google.com/mail/u/0/#inbox"
}
