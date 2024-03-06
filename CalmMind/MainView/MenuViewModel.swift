//
//  MainViewModel.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 6/3/24.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    @Published var selectedButton: String?
    
    @Published var catergories = ["Sleep", "Inner Peace", "Stress", "Anxiety"]
    
    @Published var meditationCollection = [
        MeditationModel(text: "Zen Meditation",
                        image: .meditation,
                        background: .orangeMain,
                        time: 20, index: 0),
        MeditationModel(text: "Reflection",
                        image: .reflection,
                        background: .blueMain,
                        time: 6, index: 1),
        MeditationModel(text: "Visualization",
                        image: .visualization,
                        background: .pinkMain,
                        time: 13, index: 2),
        MeditationModel(text: "Loving Kindness",
                        image: .kindness,
                        background: .yellow,
                        time: 15, index: 3),
        MeditationModel(text: "Focused Attention",
                        image: .focused,
                        background: .purpleMain,
                        time: 10, index: 4)
    ]
    
    init() {
        selectedButton = catergories.first
    }
}
