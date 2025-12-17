//
//  RestourantMenuApp.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 08.07.25.
//

import SwiftUI
import SwiftData
import UserNotifications
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct RestourantMenuApp: App {
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([SwiftDataModel.self])
            let config = ModelConfiguration(schema: schema)
            return try! ModelContainer(for: schema, configurations: [config])
        }()
    
    @AppStorage(.language) private var language = "az"
    
    @StateObject private var loginVM = LoginViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if loginVM.isAuthorized{
                    MainView()
                        .environmentObject(MenuViewModel())
                        .environmentObject(OrderViewModel())
                        .modelContainer(for: [SwiftDataModel.self])
                        .environment(\.modelContext, sharedModelContainer.mainContext)
                        .environment(\.locale, .init(identifier: language))
                        .environmentObject(loginVM)
                }else {
                   LoginView()
                        .environmentObject(loginVM)
                }
            }
           
        }
    }
}
