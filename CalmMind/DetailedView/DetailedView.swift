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
    @State private var progress: Double = 0.5

    var body: some View {
//        NavigationView {
            VStack(spacing: 0) {
                
                CircleView()
                    
                Text("Zen Meditation")
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                    .padding(.top)
                Text("Inner Peace")
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                
                HStack(alignment: .center) {
                    Button {
                        
                    } label: {
                        Image(.previews)
                    }
                    .padding()
                    
                    Button(action: {
                     }) {
                        Image(.pause)
                            .padding()
                            .background(Color.orangeMain)
                            .foregroundColor(Color.white)
                            .cornerRadius(32)
                    }
                    .frame(width: 64, height: 64)

                    Button {
                        
                    } label: {
                        Image(.fastForward)
                    }
                    .padding()

                }
                .padding(.top, 34)
                
        
                HStack(alignment: .center) {
                    Text("13:35")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    MusicTimelineProgressView(progress: $progress)
                        .tint(.yeallowMain)
                    
                    Text("15:00")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.top, 34)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                Spacer()
            }
            .padding(.top, 48)
            .background(Color.white)
            .cornerRadius(24)
            .background(
                Color.yeallowMain
                    .ignoresSafeArea()
            )
 
            .navigationBarItems(
                leading: HStack {
                    Image(.chevronArrowLeft)
                        .font(.title)
                },
                trailing:
                    Image(.download)
            )
        }
//    }
}


#Preview {
    DetailView()
}

struct MusicTimelineProgressView: View {
    @Binding var progress: Double
    
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
                    .foregroundColor(.yeallowMain)
            }
        }
        .frame(height: 8)
    }
}
 
