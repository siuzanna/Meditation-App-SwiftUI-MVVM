//
//  CircleView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct CircleView: View {
    var image: ImageResource
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 230, height: 230)
                .foregroundColor(backgroundColor)
                .offset(x: 0, y: 0)
                .overlay(
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(backgroundColor)
                )
            
            Image(image)
        }
    }
}

#Preview {
    CircleView(image: .reflection, backgroundColor: .red)
}
