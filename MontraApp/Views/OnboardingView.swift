//
//  OnboardingView.swift
//  MontraApp
//
//  Created by Aditya Himawan on 31/01/24.
//

import SwiftUI

struct OnboardingView: View {
    private let tabs: [Onboarding] = Onboarding.data
    private let dotIndicator = UIPageControl.appearance()
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                // paramater selection untuk memperesentasikan tab
                TabView(selection: $selectedTab) {
                    ForEach(tabs) { tab in
                        Group {
                            OnboardingSingleView(content: tab)
                        }
                        // tag untuk memonitor perubahan value
                        .tag(tab.tag)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeInOut, value: selectedTab)
                
                // Custom Dot :
                CustomDotIndicator(count: tabs.count, selectedTab: $selectedTab)
                    .padding([.top, .bottom], 33)
                
                VStack {
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .buttonStyle(PrimaryButtonStyle(type: .primary))
                    }
                    .buttonStyle(PrimaryButtonStyle(type: .primary))

                    
                    Button("Login") {
                        print("test")
                    }
                    .buttonStyle(PrimaryButtonStyle(type: .secondary))
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
