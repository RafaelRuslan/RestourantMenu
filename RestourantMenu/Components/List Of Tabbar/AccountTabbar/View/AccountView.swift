//
//  AccountView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var loginVM = LoginViewModel()
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Profil") {
                    Button {
                        path.append(AccountDestination.name)
                    }label: {
                        HStack{
                            Image(systemName: "person.fill")
                                .font(.title3)
                            Text(loginVM.name)
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }
                    Button {
                        path.append(AccountDestination.phone)
                    }label: {
                        HStack{
                            Image(systemName: "phone.fill")
                                .font(.title3)
                            Text(loginVM.phone)
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }
                       

                    Button{
                        path.append(AccountDestination.email)
                    }label: {
                        HStack{
                            Image(systemName: "person.fill")
                                .font(.title3)
                            Text(loginVM.email)
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }
                }
                
                Section("More") {
                    Button{
                        path.append(AccountDestination.promocodes)
                    }label: {
                        HStack{
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .font(.title3)
                            Text("Promocodes")
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }

                    Button {
                        path.append(AccountDestination.settings)
                    }label: {
                        HStack{
                            Image(systemName: "gear")
                                .font(.title3)
                            Text("Settings")
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }


                    Button {
                        path.append(AccountDestination.about)
                    }label: {
                        HStack{
                            Image(systemName: "newspaper.fill")
                                .font(.title3)
                            Text("About")
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }

                    Button{
                        path.append(AccountDestination.help)
                    }label: {
                        HStack{
                            Image(systemName: "questionmark.circle.fill")
                                .font(.title3)
                            Text("Help")
                                .font(.title3)
                                .foregroundStyle(.colorBlack)
                        }
                    }
                }
            }
            .navigationDestination(for: AccountDestination.self) { destination in
                switch destination {
                case .name:
                    NameDetailView(name: $loginVM.name)
                case .phone:
                    PhoneDetailView(phone: $loginVM.phone)
                case .email:
                    EmailView(email: $loginVM.email)
                case .promocodes:
                    PromocodesDetailView()
                case .settings:
                    SettingsView(loginVM: loginVM)
                case .about:
                    AboutView()
                case .help:
                    HelpView()
                }
            }
            .navigationTitle("Account")
        }
    }
}

extension AccountView{
    enum AccountDestination: Hashable{
        case name
        case email
        case phone
        case promocodes
        case settings
        case about
        case help
    }
}

