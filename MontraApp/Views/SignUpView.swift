//
//  SignUpView.swift
//  MontraApp
//
//  Created by Aditya Himawan on 30/01/24.
//

import SwiftUI

// Define an enum for button type
enum ButtonType {
    case primary
    case secondary
    case outline
}

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var acceptTOS: Bool = false
    @State private var isSecured: Bool = false
    @State private var isNavigateToView: Bool = false
    
    var isFormValid: Bool {
        let valid = !name.isEmpty && !password.isEmpty && !email.isEmpty && acceptTOS
        
        return valid
    }
    
    var userData: UserData {
        let user = UserData(name: name, email: email, password: password)
        
        return user
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                CustomTextField(text: $name, placeholder: "Name")
                
                
                CustomTextField(text: $email, placeholder: "Email")
                
                
                CustomSecureTextField(text: $password, isSecured: $isSecured)
                
                
                HStack {
                    CustomCheckMark(isChecked: $acceptTOS)
                    Text("By signing up, you agree to the **[Terms of Service](https://iswift.mayar.link)** and **[Privacy Policy](https://moyahexagon.com)**.")
                        .tint(.violet100)
                    
                }
                
                
                VStack(alignment: .center, spacing: 16) {
                    Button("Sign Up") {
                        if isFormValid {
                            isNavigateToView = true
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle(type: .primary))
                    .disabled(!isFormValid)
                    
                    Text("Or with")
                        .font(.custom("Inter", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.gray)
                    Button {
                        print("Google Button tapped")
                    } label: {
                        HStack {
                            Image(.flatIconsGoogle)
                            Text("Sign Up with Google")
                                .foregroundStyle(.black)
                                .font(.custom("Inter", size: 18))
                                .fontWeight(.semibold)
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle(type: .outline))
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundStyle(.gray)
                        NavigationLink(destination: Text("View Login")) {
                            Text("Login")
                                .foregroundStyle(.violet100)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .padding(.top, 20)
                                        .foregroundColor(.violet100)
                                )
                        }
                    }
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.medium)
                }
            }
            .padding()
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                    }
                    .tint(.black)
                }
            }
            .navigationDestination(isPresented: $isNavigateToView) {
                ResultsSignUpView(userData: userData)
            }
        }
    }
}

#Preview {
    SignUpView()
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(width: 343, height: 56, alignment: .leading)
            .background(.white)
            .foregroundStyle(.light20)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 0.95, green: 0.95, blue: 0.98), lineWidth: 1)
                
            )
            .textInputAutocapitalization(.never)
    }
}

struct CustomSecureTextField: View {
    @Binding var text: String
    @Binding var isSecured: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(width: 343, height: 56)
            
            Group {
                if isSecured {
                    TextField("Password", text: $text)
                } else {
                    SecureField("Password", text: $text)
                }
            }
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .padding(.horizontal)
            .frame(width: 343, height: 56)
            
            // Show or Unhide text password
            Button {
                isSecured.toggle()
            } label: {
                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .foregroundStyle(.gray)
            }
            .padding(.trailing, 16)
            .frame(width: 343, height: 56, alignment: .trailing)
        }
        .frame(width: 343, height: 56)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(red: 0.95, green: 0.95, blue: 0.98), lineWidth: 1)
            
        )
    }
}

struct CustomCheckMark: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square" : "square")
            .onTapGesture {
                isChecked.toggle()
            }
            .foregroundStyle(.violet100)
            .font(.title)
        
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        var foregroundColor: Color
        var backgroundColor: Color
        var borderColor: Color?
        
        switch type {
        case .primary:
            foregroundColor = .white
            backgroundColor = Color("Violet100")
        case .secondary:
            foregroundColor = Color("Violet100")
            backgroundColor = Color("Violet20")
        case .outline:
            foregroundColor = Color("Violet100")
            backgroundColor = .clear
            borderColor = Color(red: 0.95, green: 0.95, blue: 0.98)
        }
        
        return configuration.label
            .frame(width: 343, height: 56)
            .font(.custom("Inter", size: 18))
            .fontWeight(.semibold)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(borderColor ?? .clear, lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .disabled(configuration.isPressed)
    }
}
