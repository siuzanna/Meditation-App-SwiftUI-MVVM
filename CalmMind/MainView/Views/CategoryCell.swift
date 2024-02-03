//
//  CategoryCell.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct CategoryCell: View {
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    
    init(model: CategoryModel) {
        self.text = model.text
        self.image = model.image
        self.background = model.background
        self.time = model.time
    }
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
                Spacer()
                
                Button(action: {
//                    action()
                }) {
                    Text("\(time) min")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 12))
                .background(.white)
                .cornerRadius(16)
            }
            .padding()
            Image(image)
                .padding(.bottom)
        }
        .background(background)
        .cornerRadius(16)
    }
}
