//
//  Main.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI


struct MainView: View {
    let items = ["Sleep", "Inner Peace", "Stress", "Anxiety"]
    @State private var selectedButton: String?
    let itemss = [
        Model(text: "Zen Meditation",
              image: .meditation,
              background: .orangeMain,
              time: 20,
              action: {
                  
              }),
        Model(text: "Reflection",
              image: .reflection,
              background: .blueMain,
              time: 6,
              action: {
                  
              }),
        Model(text: "Visualization",
              image: .visualization,
              background: .pinkMain,
              time: 13,
              action: {
                  
              }),
        Model(text: "Loving\nKindness",
              image: .kindness,
              background: .yellow,
              time: 15,
              action: {
                  
              }),
        Model(text: "Focused\nAttention",
              image: .focused,
              background: .purpleMain,
              time: 10,
              action: {
                  
              })
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                        ForEach(items, id: \.self) { item in
                            ButtonView(text: item, isSelected: selectedButton == item) {
                                selectedButton = item
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 80)
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        VStack {
                            ForEach(itemss) { item in
                                NavigationLink(destination: DetailView()) {
                                    ItemView(model: item)
                                        .padding(.leading)
                                        .padding(.trailing)
                                        .padding(.bottom)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarItems(
                leading: HStack {
                    Image(.logo)
                        .font(.title)
                    Text("Hi, Martha")
                        .fontWeight(.medium)
                        .font(.system(size: 24))
                },
                trailing: Button(action: {
                    print("Navigation button tapped")
                }) {
                    Image(.burger)
                }
            )
            .onAppear {
                selectedButton = items.first
            }
        }
    }
}

struct Model: Identifiable, Hashable {
    let id: UUID
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    let action: () -> Void
    
    init(text: String, image: ImageResource, background: Color, time: Int, action: @escaping () -> Void) {
        self.id = UUID()
        self.text = text
        self.image = image
        self.background = background
        self.time = time
        self.action = action
    }
    
    // Implement Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Implement Equatable protocol for completeness
    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ItemView: View {
    let text: String
    let image: ImageResource
    let background: Color
    let time: Int
    
    let action: () -> Void
    
    init(model: Model) {
        self.text = model.text
        self.image = model.image
        self.background = model.background
        self.time = model.time
        self.action = model.action
    }
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                
                Spacer()
                
                Button(action: {
                    action()
                }) {
                    Text("\(time) min")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .padding(.init(top: 5, leading: 12, bottom: 5, trailing: 12))
                .background(.white)
                .cornerRadius(16)
            }
            .padding()
            Image(image)
                .padding(.bottom)
        }
        .background(background)
        .cornerRadius(16)
    }
}

#Preview {
    MainView()
}

struct ButtonView: View {
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
