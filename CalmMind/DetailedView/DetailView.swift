//
//  DetailView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI
import AVKit

struct DetailView: View {
    @State private var progress: Double = 0.5
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var isPlaying = false
    @State private var url: URL!
    @State private var selectedIndex = 0
    @State private var player: AVPlayer?

    let radioURLs = [
        "http://mediaserv30.live-streams.nl:8086/live",
        "http://mediaserv33.live-streams.nl:8034/live",
        "http://mediaserv38.live-streams.nl:8006/live",
        "http://mediaserv33.live-streams.nl:8036/live",
        "http://mediaserv30.live-streams.nl:8000/live",
        "http://mediaserv30.live-streams.nl:8088/live",
        "http://mediaserv38.live-streams.nl:8027/live",
        "http://mediaserv21.live-streams.nl:8000/live"
    ]
    
    var body: some View {
        NavigationView {
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
                        if selectedIndex >= 1 {
                            player?.pause()
                            selectedIndex -= 1
                            url = URL(string: radioURLs[selectedIndex])!
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                    } label: {
                        Image(.previews)
                    }
                    .padding()
                    
                    Button(action: {
                         isPlaying.toggle()
                        if  isPlaying {
                             player?.play()
                        } else {
                             player?.pause()
                        }
                        
                    }) {
                        Image(isPlaying ? .pause : .play)
                            .resizable()
//                            .aspectRatio(contentMode: .center)
                            .frame(width: 32, height: 32)
                            .padding()
                            .background(Color.orangeMain)
                            .foregroundColor(Color.white)
                            .cornerRadius(32)
                    }
                    .frame(width: 64, height: 64)
                    
                    Button {
                        if selectedIndex < radioURLs.count-1 {
                            player?.pause()
                            selectedIndex += 1
                            url = URL(string: radioURLs[selectedIndex])!
                            player = AVPlayer(url: url)
                            player?.play()
                        }
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
            .onAppear {
                        url = URL(string: radioURLs[selectedIndex])!
                        player = AVPlayer(url: url)
                        player?.play()
                    }
            .navigationBarItems(
                leading: HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(.chevronArrowLeft)
                            .font(.title)
                        
                    }
                },
                trailing:
                    Image(.download)
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailView()
}
