//
//  LandmarkDetail.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    private let avatarOffset: CGFloat = -100
    private let mapSize: CGFloat = 300
    
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: mapSize)
            
            CircleImage(image: landmark.image)
                .offset(y: avatarOffset)
                .padding(.bottom, avatarOffset)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
