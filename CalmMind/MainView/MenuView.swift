//
//  Main.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedButton: String?
    
    let items = ["Sleep", "Inner Peace", "Stress", "Anxiety"]
    let itemss = [
        CategoryModel(text: "Zen Meditation",
                      image: .meditation,
                      background: .orangeMain,
                      time: 20),
        CategoryModel(text: "Reflection",
                      image: .reflection,
                      background: .blueMain,
                      time: 6),
        CategoryModel(text: "Visualization",
                      image: .visualization,
                      background: .pinkMain,
                      time: 13),
        CategoryModel(text: "Loving\nKindness",
                      image: .kindness,
                      background: .yellow,
                      time: 15),
        CategoryModel(text: "Focused\nAttention",
                      image: .focused,
                      background: .purpleMain,
                      time: 10)]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(items, id: \.self) { item in
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
                    ForEach(itemss) { item in
                        NavigationLink(destination: DetailView()) {
                            CategoryCell(model: item)
                                .padding(.leading)
                                .padding(.trailing)
                                .padding(.bottom)
                        }
                    }
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
            selectedButton = items.first
        }
    }
}

#Preview {
    MainView()
}
