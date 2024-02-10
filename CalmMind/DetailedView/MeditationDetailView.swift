//
//  DetailView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI
import AVKit
//https://www.hionline.eu/streaming-url/

struct MeditationDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var player: AVPlayer?
    @State private var progress: Double = 0.2
    @State private var isPlaying = false
    @State private var currentURL: URL!
    @State private var selectedIndex = 0
    
    var model: MeditationModel
    
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
                Spacer()
                
                CircleView(image: model.image, backgroundColor: model.background)
                
                Text(model.text)
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
                            currentURL = URL(string: radioURLs[selectedIndex])!
                            player = AVPlayer(url: currentURL)
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
                            .frame(width: 32, height: 32)
                            .padding()
                            .background(model.background)
                            .foregroundColor(Color.white)
                            .cornerRadius(32)
                    }
                    .frame(width: 64, height: 64)
                    
                    Button {
                        if selectedIndex < radioURLs.count-1 {
                            player?.pause()
                            selectedIndex += 1
                            currentURL = URL(string: radioURLs[selectedIndex])!
                            player = AVPlayer(url: currentURL)
                            player?.play()
                        }
                    } label: {
                        Image(.fastForward)
                    }
                    .padding()
                    
                }
                .padding(.top, 34)
                
                HStack(alignment: .center) {
                    Text("00:02")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    MusicTimelineProgressView(progress: $progress, mainColor: model.background)
                        .tint(.yeallowMain)
                    
                    Text("00:0\(model.time)")
                        .fontWeight(.regular)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.top, 34)
                .padding(.leading, 30)
                .padding(.trailing, 30)
                
                Spacer()
                
            }
            .background(Color.white)
            .cornerRadius(24)
            .background(
                Color.yeallowMain
                    .ignoresSafeArea()
            )
            .onAppear {
                currentURL = URL(string: radioURLs[selectedIndex])!
                player = AVPlayer(url: currentURL)
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
    MeditationDetailView(model: MeditationModel(text: "Reflection",
                                    image: .reflection,
                                    background: .blueMain,
                                    time: 6, index: 1))
}
