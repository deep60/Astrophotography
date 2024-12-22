//
//  Camera.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import Foundation

public struct Camera: Identifiable {
    public var brand: String
    public var name: String
    public var pixelSize: Double
    
    public var id: String {
        "\(self.brand).\(self.name)"
    }
    
    public static let all: [Camera] = [
        Camera(brand: "Sony", name: "A7R IV", pixelSize: 3.5),
        Camera(brand: "Canon", name: "EOS R7", pixelSize: 3.2),
        Camera(brand: "ZWO", name: "ASI585MC PRO", pixelSize: 2.9),
        Camera(brand: "Zwo", name: "ASI678MM", pixelSize: 2),
        Camera(brand: "Zwo", name: "ASI220MM Mini", pixelSize: 4),
    ]
}
