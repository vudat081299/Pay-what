//
//  LandmarkRow.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
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
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

