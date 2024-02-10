//
//  CategoryCell.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MeditationCell: View {
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    
    init(model: MeditationModel) {
        self.text = model.text
        self.image = model.image
        self.background = model.background
        self.time = model.time
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(text)
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Button(action: {
                    }) {
                        Text("\(time) min")
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
            
            Image(image)
                .padding(.bottom)
        }
        .background(background)
        .cornerRadius(16)
    }
}

#Preview {
    MeditationCell(model: MeditationModel(text: "Reflection",
                                      image: .reflection,
                                      background: .blueMain,
                                      time: 6, index: 1))
    .frame(width: UIScreen.main.bounds.width/2)
}
