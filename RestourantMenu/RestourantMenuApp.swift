//
//  RestourantMenuApp.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct RestourantMenuApp: App {
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([SwiftDataModel.self])
            let config = ModelConfiguration(schema: schema)
            return try! ModelContainer(for: schema, configurations: [config])
        }()
    
    @AppStorage(.language) private var language = "az"
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView()
                    .environmentObject(MenuViewModel())
                    .environmentObject(OrderViewModel())
                    .modelContainer(for: [SwiftDataModel.self])
                    .environment(\.modelContext, sharedModelContainer.mainContext)
                    .environment(\.locale, .init(identifier: language))
            }
        }
    }
}
