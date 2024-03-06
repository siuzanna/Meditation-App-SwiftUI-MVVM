//
//  DetailViewModel.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 6/3/24.
//

import Foundation
import AVFoundation

class MeditationDetailViewModel: ObservableObject {
    
    @Published var player: AVPlayer?
    @Published var currentURL: URL?
    @Published var selectedIndex = 0
    @Published var progress: Double = 0.2
    @Published var radioURLs: [String]
    @Published var isPlaying = false
    @Published var model: MeditationModel
    
    init(model: MeditationModel) {
        self.radioURLs = [
            "http://mediaserv30.live-streams.nl:8086/live",
            "http://mediaserv33.live-streams.nl:8034/live",
            "http://mediaserv38.live-streams.nl:8006/live",
            "http://mediaserv33.live-streams.nl:8036/live",
            "http://mediaserv30.live-streams.nl:8000/live",
            "http://mediaserv30.live-streams.nl:8088/live",
            "http://mediaserv38.live-streams.nl:8027/live",
            "http://mediaserv21.live-streams.nl:8000/live"
        ]
        self.model = model
        self.currentURL = URL(string: radioURLs[selectedIndex])
        self.player = AVPlayer(url: currentURL!)
    }
    
    func previewsTrackTapped() {
        if selectedIndex >= 1 {
            player?.pause()
            selectedIndex -= 1
            currentURL = URL(string: radioURLs[selectedIndex])!
            player = AVPlayer(url: currentURL!)
            player?.play()
        }
    }
    
    func nextTrackTapped() {
        if selectedIndex < radioURLs.count-1 {
            player?.pause()
            selectedIndex += 1
            currentURL = URL(string: radioURLs[selectedIndex])!
            player = AVPlayer(url: currentURL!)
            player?.play()
        }
    }
    
    func pausePlayTrackTapped() {
        isPlaying.toggle()
        if  isPlaying {
            player?.play()
        } else {
            player?.pause()
        }
    }
}
