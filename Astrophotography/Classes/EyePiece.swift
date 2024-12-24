//
//  EyePiece.swift
//  Astrophotography
//
//  Created by P Deepanshu on 24/12/24.
//

import Foundation

public struct EyePiece: Identifiable {
    public var brand: String
    public var name: String
    public var focalLength: Int
    public var fieldOfView: Double
    
    public var id: String {
        "\(self.brand).\(self.name).\(self.focalLength)mm"
    }
    
    public static let all: [EyePiece] = [
        EyePiece( brand: "Celestron", name: "PLÖSSL",    focalLength: 13, fieldOfView: 52 ),
        EyePiece( brand: "Celestron", name: "PLÖSSL",    focalLength: 40, fieldOfView: 43 ),
        EyePiece( brand: "Celestron", name: "X-Cell LX", focalLength: 9,  fieldOfView: 60 ),
        EyePiece( brand: "Celestron", name: "X-Cell LX", focalLength: 25, fieldOfView: 60 ),
    ]
}
