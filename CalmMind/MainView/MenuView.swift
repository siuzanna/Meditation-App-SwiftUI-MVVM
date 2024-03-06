//
//  Main.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                    ForEach(viewModel.catergories, id: \.self) { item in
                        CategoryCell(text: item, isSelected: viewModel.selectedButton == item) {
                            viewModel.selectedButton = item
                        }
                    }
                }
                .padding()
            }
            .frame(height: 80)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    openDetailView(viewModel.meditationCollection.first!)
                        .padding(.horizontal)
                    HStack(alignment: .top, spacing: 10) {
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(viewModel.meditationCollection, id: \.self) { item in
                                if item.index%2 == 0 && item.index != 0 {
                                    openDetailView(item)
                                }
                            }
                        }
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 0),
                        ], spacing: 16) {
                            ForEach(viewModel.meditationCollection, id: \.self) { item in
                                if item.index%2 != 0 {
                                    openDetailView(item)
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
    }
    
    func openDetailView(_ model: MeditationModel) -> NavigationLink<MeditationCell, MeditationDetailView> {
        return NavigationLink(destination: MeditationDetailView(model: model)) {
            MeditationCell(viewModel: model)
        }
    }
}

#Preview {
    NavigationView {
        MainView(viewModel: MenuViewModel())
    }
}
