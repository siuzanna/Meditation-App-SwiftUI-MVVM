//
//  DetailView.swift
//  CalmMind
//
//  Created by Siuzanna Karagulova   on 3/2/24.
//

import SwiftUI
import AVKit

struct MeditationDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MeditationDetailViewModel
    
    init(model: MeditationModel) {
        self.viewModel = MeditationDetailViewModel(model: model)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                
                CircleView(image: viewModel.model.image,
                           backgroundColor: viewModel.model.background)
                
                Text(viewModel.model.text)
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                    .padding(.top)
                
                Text("Inner Peace")
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                HStack(alignment: .center) {
                    Button {
                        viewModel.previewsTrackTapped()
                    } label: {
                        Image(.previews)
                    }
                    .padding()
                    
                    Button(action: {
                        viewModel.pausePlayTrackTapped()
                    }) {
                        Image(viewModel.isPlaying ? .pause : .play)
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding()
                            .background(viewModel.model.background)
                            .foregroundColor(Color.white)
                            .cornerRadius(32)
                    }
                    .frame(width: 64, height: 64)
                    
                    Button {
                        viewModel.nextTrackTapped()
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
                    
                    MusicTimelineProgressView(progress: $viewModel.progress,
                                              mainColor: viewModel.model.background)
                    .tint(.yeallowMain)
                    
                    Text("00:0\(viewModel.model.time)")
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

//https://www.hionline.eu/streaming-url/
