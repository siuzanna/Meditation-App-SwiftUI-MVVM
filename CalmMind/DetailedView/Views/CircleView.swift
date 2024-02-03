//
//  CircleView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 230, height: 230)
                .foregroundColor(.orangeMain)
                .offset(x: 0, y: 0)
                .overlay(
                    Circle()
                        .frame(width: 220, height: 220)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.orangeMain)
                        )
                )
            Image(.bdgirl)
        }
    }
}
