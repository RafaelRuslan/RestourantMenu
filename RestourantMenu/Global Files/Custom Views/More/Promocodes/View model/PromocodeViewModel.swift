//
//  PromocodeViewModel.swift
//  RestourantMenu
//
//  Created by Rafael Agayev on 19.12.25.
//

import Foundation

class PromocodeViewModel: ObservableObject{
    
    @Published var promocode : String = ""
    
    @Published var message: String = ""
    
    @Published var enterButton: Bool = false
    
    func promoProblem(){
        if promocode.uppercased() == "SALAM2024" || promocode.lowercased() == "ruslan2023"{
            message = "Promocode accepted 🎉"
        }else{
            message = "wrong promocode ‼️"
        }
    }
}
