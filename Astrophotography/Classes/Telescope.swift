//
//  Telescope.swift
//  Astrophotography
//
//  Created by P Deepanshu on 22/12/24.
//

import Foundation

public struct Telescope: Identifiable {
    public var brand: String
    public var name: String
    public var aperture: Double
    public var focalLength: Double
    public var origin: String
    
    public var focalRatio: Double {
        self.focalLength / self.aperture
    }
    
    public var id: String {
        "\(self.brand).\(self.name)"
    }
    
    public static let all: [Telescope] = [
        Telescope(brand: "Celestron", name: "NEXSTAR 8SE", aperture: 80, focalLength: 2000, origin: "China"),
        Telescope(brand: "Celestron", name: "NEXSTAR Evolution 6", aperture: 150, focalLength: 1500, origin: "China"),
        Telescope(brand: "Celestron", name: "NEXSTAR Evolution 6 + 0.63 Reducer", aperture: 150, focalLength: 1500 * 0.63, origin: "China"),
        Telescope(brand: "Lunt", name: "60mm Universal Telescope", aperture: 60, focalLength: 400, origin: "USA"),
    ]
}
