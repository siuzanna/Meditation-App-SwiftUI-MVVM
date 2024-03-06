//
//  CategoryModel.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct MeditationModel: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    var index: Int
    
    static func ==(lhs: MeditationModel, rhs: MeditationModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
