//
//  AccountView.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 11.07.25.
//

import SwiftUI

struct AccountView: View {
    
    @ViewBuilder
    func detailView(for item: Binding<ProfileModel>) -> some View{
        switch item.wrappedValue.icon{
        case "person.fill":
            NameDetailView(profile: item)
        case "phone.fill":
            PhoneDetailView(profile: item)
        case "mail.fill":
            EmailView(profile: item)
        default:
            Text("Detail not found")
        }
    }
    
    @ViewBuilder
    func moreDetailView(for item: Binding<ProfileModel>) -> some View{
        switch item.wrappedValue.icon{
        case "tag.fill":
            PromocodesDetailView()
        case "gear":
            SettingsView()
        case "i.circle":
            AboutView()
        case "questionmark.circle":
            HelpView()
        default:
            Text("Detail not found")
        }
    }
    
   
    @State private var profil : [ProfileModel] = [
        ProfileModel(icon: "person.fill", name: "Ruslan Agayev"),
        ProfileModel(icon: "phone.fill", name: "+1230292930"),
        ProfileModel(icon: "mail.fill", name: "rafaretti2021@gmail.com")
    ]
    
    @State private var more : [ProfileModel] = [
        ProfileModel(icon: "tag.fill", name: "Promocodes"),
        ProfileModel(icon: "gear", name: "Settings"),
        ProfileModel(icon: "i.circle", name: "About..."),
        ProfileModel(icon: "questionmark.circle", name: "Help")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                AngularGradient(colors: [.black.opacity(0.5), .black], center: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        Section("Profil") {
                            ForEach(profil.indices, id: \.self) { item in
                                NavigationLink(destination: detailView(for: $profil[item]))
                                {
                                    HStack {
                                        Image(systemName: profil[item].icon)
                                            .foregroundStyle(.blue)
                                            .font(.title2)
                                        Text(profil[item].name)
                                            .font(.title2)
                                    }
                                }
                            }
                        }
                        Section("More") {
                            ForEach(more.indices, id: \.self){ moreno in
                                NavigationLink(destination: moreDetailView(for: $more[moreno])){
                                    HStack{
                                        Image(systemName: more[moreno].icon)
                                            .infoStyle()
                                        Text(more[moreno].name)
                                            .font(.title2)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
                GeometryReader { metric in
                    VStack{
                        Spacer()
                        Text("All rights reserved © 2025")
                            .infoStyle()
                            .frame(width: metric.size.width)
                            .padding(.bottom, 20)
                    }
                    .frame(width: metric.size.width, height: metric.size.height)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Settings")
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
        
    }
}

#Preview {
    AccountView()
}
