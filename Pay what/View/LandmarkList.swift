//
//  LandmarkList.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        v1
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        v2
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
//        
//        v3
//        List(landmarks) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
//        v4
        NavigationSplitView {
            List(landmarks) { landmark in
                LandmarkRow(landmark: landmark)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
