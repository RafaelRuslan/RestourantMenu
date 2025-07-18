//
//  RestourantMenuApp.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI

@main
struct RestourantMenuApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView()
                    .environmentObject(OrderViewModel())
            }
        }
    }
}
