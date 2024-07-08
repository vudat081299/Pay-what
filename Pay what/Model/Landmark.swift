//
//  Landmark.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import Foundation
import SwiftUI
import CoreLocation

class Landmark: Equatable, Codable, Identifiable {
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Codable {
        var latitude: Double
        var longitude: Double
    }
}
