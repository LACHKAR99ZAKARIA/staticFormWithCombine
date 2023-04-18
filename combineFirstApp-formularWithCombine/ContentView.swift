//
//  ContentView.swift
//  combineFirstApp-formularWithCombine
//
//  Created by zakaria lachkar on 18/04/2023.
//

import SwiftUI
import Combine

class User : ObservableObject {
    @Published var email : String = ""
    @Published var password : String = ""
}

struct ContentView: View {
    
    @ObservedObject var userInfo = User()
    
    
    
    var body: some View {
            VStack {
                Form {
                    Section(header: Text("Login Information")) {
                        TextField("Email", text: $userInfo.email)
                        SecureField("Password", text: $userInfo.password)
                        Button("Login") {
                                print("User Loged")
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                            .shadow(radius: 4)
                            .padding(-1)
                            .opacity(0.6)
                    )
                    Text("Email: \(userInfo.email)")
                    Text("Password: \(userInfo.password)")
                }
            }
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
