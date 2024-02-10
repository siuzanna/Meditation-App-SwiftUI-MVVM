//
//  CategoryModel.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MeditationModel: Identifiable, Hashable {
    let id: UUID
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    var index: Int
    
    init(text: String, image: ImageResource, background: Color, time: Int, index: Int) {
        self.id = UUID()
        self.text = text
        self.image = image
        self.background = background
        self.time = time
        self.index = index
    }
    
    static func ==(lhs: MeditationModel, rhs: MeditationModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
