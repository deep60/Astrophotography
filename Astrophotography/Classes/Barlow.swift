//
//  Barlow.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import Foundation

public struct Barlow: Identifiable {
    public var maginification: Int
    
    public var description: String {
        if self .maginification == 0 {
            return "None"
        }
        
        return "\(self.maginification)x Barlow"
    }
    
    public var id: String {
        self.description
    }
    
    public static let all: [Barlow] = [
        Barlow(maginification: 0),
        Barlow(maginification: 2),
        Barlow(maginification: 3),
    ]
}
