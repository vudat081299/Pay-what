//
//  ModelData.swift
//  Pay what
//
//  Created by Dat Vu on 7/7/24.
//

import Foundation

// v2
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}

// v1
//var landmarks: [Landmark] = load("landmarkData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
