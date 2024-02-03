//
//  ContentView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isMainViewActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Circle()
                    .frame(width: 280, height: 280)
                    .foregroundColor(.orangeMain)
                    .offset(x: 140, y: -350)
                
                Circle()
                    .frame(width: 495, height: 495)
                    .foregroundColor(.blueMain)
                    .offset(x: 0, y: 300)
                
                VStack(alignment: .leading) {
                    Text("CalmMind")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.leading, 24)
                        .padding(.leading, 50)
                        .foregroundColor(.gray)
                    
                    Text("Stress Less and\nLaugh Louder")
                        .fontWeight(.bold)
                        .padding(.leading, 24)
                        .font(.system(size: 40))
                        .padding(.leading, 50)
                    
                    HStack {
                        Spacer()
                        Image(.onboarding)
                        Spacer()
                    }
                    NavigationLink(
                        destination: MainView(),
                        isActive: $isMainViewActive,
                        label: {
                            EmptyView()
                        }
                    )
                    HStack {
                        
                        Spacer()
                        Button(action: {
                            self.isMainViewActive = true
                        }) {
                            Image(.arrowRight)
                                .foregroundColor(Color.red)
                                .padding()
                                .background(Color.utility)
                                .foregroundColor(Color.white)
                                .cornerRadius(32)
                        }
                        .frame(width: 64, height: 64)
                        Spacer()
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
