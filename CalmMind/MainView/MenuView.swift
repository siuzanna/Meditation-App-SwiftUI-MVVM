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
    
    let items = [
        CategoryModel(text: "Zen Meditation",
                      image: .meditation,
                      background: .orangeMain,
                      time: 20, index: 0),
        CategoryModel(text: "Reflection",
                      image: .reflection,
                      background: .blueMain,
                      time: 6, index: 1),
        CategoryModel(text: "Visualization",
                      image: .visualization,
                      background: .pinkMain,
                      time: 13, index: 2),
        CategoryModel(text: "Loving Kindness",
                      image: .kindness,
                      background: .yellow,
                      time: 15, index: 3),
        CategoryModel(text: "Focused Attention",
                      image: .focused,
                      background: .purpleMain,
                      time: 10, index: 4)
    ]
    
    let columns = [
        GridItem(.fixed(.infinity/2)),
        GridItem(.fixed(.infinity/2))
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
                    NavigationLink(destination: DetailView(model: items.first!)) {
                        CategoryCell(model: items.first!)
                    }
                    .padding(.horizontal)
                    
                    HStack(alignment: .top, spacing: 10) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(items, id: \.self) { item in
                                if item.index%2 == 0 && item.index != 0 {
                                    NavigationLink(destination: DetailView(model: item)) {
                                        CategoryCell(model: item)
                                    }
                                }
                            }
                        }
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(items, id: \.self) { item in
                                if item.index%2 != 0 {
                                    NavigationLink(destination: DetailView(model: item)) {
                                        CategoryCell(model: item)
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
    MainView()
}
