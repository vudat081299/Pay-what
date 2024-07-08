//
//  LandmarkRow.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    private let imageSize: CGFloat = 50
    private let imageCornerRadius: CGFloat = 10

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(imageCornerRadius)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

// v1
//#Preview("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//}
//
// v2
//#Preview("Silver Salmon Creek") {
//    LandmarkRow(landmark: landmarks[1])
//}

// v3
#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

