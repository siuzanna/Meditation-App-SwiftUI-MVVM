//
//  MusicTimelineView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MusicTimelineProgressView: View {
    @Binding var progress: Double
    var mainColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 8)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    .cornerRadius(8)
                
                Rectangle()
                    .frame(width: CGFloat(progress) * geometry.size.width, height: 8)
                    .foregroundColor(mainColor)
            }
        }
        .frame(height: 8)
    }
}
