//
//  Main.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedButton: String?
    let catergories = ["Sleep", "Inner Peace", "Stress", "Anxiety"]
    
    let meditationCollection = [
        MeditationModel(text: "Zen Meditation",
                        image: .meditation,
                        background: .orangeMain,
                        time: 20, index: 0),
        MeditationModel(text: "Reflection",
                        image: .reflection,
                        background: .blueMain,
                        time: 6, index: 1),
        MeditationModel(text: "Visualization",
                        image: .visualization,
                        background: .pinkMain,
                        time: 13, index: 2),
        MeditationModel(text: "Loving Kindness",
                        image: .kindness,
                        background: .yellow,
                        time: 15, index: 3),
        MeditationModel(text: "Focused Attention",
                        image: .focused,
                        background: .purpleMain,
                        time: 10, index: 4)
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(catergories, id: \.self) { item in
                        FiterCell(text: item, isSelected: selectedButton == item) {
                            selectedButton = item
                        }
                    }
                }
                .padding()
            }
            .frame(height: 80)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    NavigationLink(destination: MeditationDetailView(model: meditationCollection.first!)) {
                        MeditationCell(model: meditationCollection.first!)
                    }
                    .padding(.horizontal)
                    
                    HStack(alignment: .top, spacing: 10) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(meditationCollection, id: \.self) { item in
                                if item.index%2 == 0 && item.index != 0 {
                                    NavigationLink(destination: MeditationDetailView(model: item)) {
                                        MeditationCell(model: item)
                                    }
                                }
                            }
                        }
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(meditationCollection, id: \.self) { item in
                                if item.index%2 != 0 {
                                    NavigationLink(destination: MeditationDetailView(model: item)) {
                                        MeditationCell(model: item)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationBarItems(
            leading: HStack {
                Image(.logo)
                    .font(.title)
                Text("Hi, Martha")
                    .fontWeight(.medium)
                    .font(.system(size: 24))
            },
            trailing: Button(action: {
                print("Navigation button tapped")
            }) {
                Image(.burger)
            }
        )
        .navigationBarBackButtonHidden(true)
        .onAppear {
            selectedButton = catergories.first
        }
    }
}

#Preview {
    NavigationView {
        MainView()
    }
}
