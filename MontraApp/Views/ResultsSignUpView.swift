//
//  ResultsSignUpView.swift
//  MontraApp
//
//  Created by Aditya Himawan on 30/01/24.
//

import SwiftUI


struct ResultsSignUpView: View {
    var userData: UserData
    
    init(userData: UserData) {
        self.userData = userData
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Welcome, \(userData.name)!")
                .font(.title)
            
            Text("Your email: \(userData.email)")
            
            Text("Your password: \(userData.password)")
           
        }
    }
}

#Preview {
    ResultsSignUpView(userData: UserData(name: "test", email: "test", password: "test"))
}
