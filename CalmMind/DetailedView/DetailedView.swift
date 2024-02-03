//
//  DetailedView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

//#Preview {
//    CircleView()
//}

struct CircleView: View {
    
    var body: some View {
        ZStack {
//            Color.white
            
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

struct DetailView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Color.yeallowMain.ignoresSafeArea()
                VStack {
                    Color.white
  
                    CircleView()
                        
                    Text("Zen Meditation")
                        .fontWeight(.medium)
                        .font(.system(size: 24))
                        .padding(.top)
                    Text("Inner Peace")
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    
                }
                .cornerRadius(24)
                .padding(.top)
                
                .navigationBarItems(
                    leading: HStack {
                        Image(.chevronArrowLeft)
                            .font(.title)
                    },
                    trailing:
                        Image(.download)
                )
            }
        }
    }
}


#Preview {
    DetailView()
}

struct RoundedTopCorners: Shape {
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + radius))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        return path
    }
}
