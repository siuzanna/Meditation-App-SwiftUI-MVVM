//
//  CategoryCell.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MeditationCell: View {
    let viewModel: MeditationModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.text)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Button(action: {
                    }) {
                        Text("\(viewModel.time) min")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                            .font(.system(size: 12))
                    }
                    .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 12))
                    .background(.white)
                    .cornerRadius(16)
                }
                .padding()
                
                Spacer()
            }
            Image(viewModel.image)
                .padding(.bottom)
        }
        .background(viewModel.background)
        .cornerRadius(16)
    }
}

#Preview {
    MeditationCell(viewModel: MeditationModel(text: "Reflection",
                                              image: .reflection,
                                              background: .blueMain,
                                              time: 6, index: 1))
    .frame(width: UIScreen.main.bounds.width/2)
}
