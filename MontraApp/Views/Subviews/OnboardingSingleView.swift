//
//  OnboardingSingleView.swift
//  MontraApp
//
//  Created by Aditya Himawan on 31/01/24.
//

import SwiftUI

struct OnboardingSingleView: View {
    var content: Onboarding
    var body: some View {
        VStack {
            Image(content.image)
                .resizable()
                .scaledToFill()
                .frame(width: 312, height: 312)
            
            VStack(spacing: 16) {
                Text(content.title)
                    .font(.custom("Inter", size: 32))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/, reservesSpace: true)
                    .foregroundStyle(Color("Dark50"))
                
                Text(content.subtitle)
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(Color("Light20"))
            }
            .frame(width: 300, height: 180)
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    OnboardingSingleView(content: Onboarding.data[1])
}
