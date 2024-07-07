//
//  CircleImage.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("avatar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
