//
//  CustomDotIndicator.swift
//  MontraApp
//
//  Created by Aditya Himawan on 31/01/24.
//

import SwiftUI

struct CustomDotIndicator: View {
    let count: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            //  id:\.self jadikan keypad self datanya unique
            ForEach(0..<count, id:\.self) { tab in
                Circle()
                    .fill(tab == selectedTab ? Color("Violet100") : Color("Violet20"))
                    .scaleEffect(tab == selectedTab ? 2.0 : 1.0)
                    .frame(width: 8, height: 8)
                    .padding(.horizontal, 4)
                    .onTapGesture {
                        selectedTab = tab
                    }
            }
        }
        .animation(.easeOut, value: selectedTab)
    }
}

#Preview {
    //  kalo #preview lebih dari satu baris makan give a return
    @State var selectedTab = 0
    return CustomDotIndicator(count: 3, selectedTab: $selectedTab)
}
