//
//  CategoryCell.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI

struct CategoryCell: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .foregroundColor(isSelected ? Color.white : Color.black)
                .padding(10)
                .background(isSelected ? Color.utility : Color.clear)
                .cornerRadius(16)
        }
    }
}
