//
//  DetailView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

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
//            .navigationBarTitle("Main Title", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    Image(.chevronArrowLeft)
                        .font(.title)
                        .navigationBarBackButtonHidden(true)
                },
                trailing:
                    Image(.download)
            )
//        }
    }
}

#Preview {
    DetailView()
}
