//
//  Time.swift
//  Astrophotography
//
//  Created by P Deepanshu on 22/12/24.
//

import Foundation


public struct Time: Identifiable {
    public var seconds: Int
    public var description: String {
        let min = self.seconds / 60
        let sec = self.seconds % 60
        
        let minLabel = min > 1 ? "minutes" : "minute"
        let secLabel = sec > 1 ? "seconds" : "second"
        
        if min == 0 {
            return "\(sec) \(secLabel)"
        } else if sec == 0 {
            return "\(min) \(minLabel)"
        } else {
            return "\(min) \(minLabel) \(sec) \(secLabel)"
        }
    }
    
    public var id: String {
        self.description
    }
    
    public static let all: [Time] = [
        Time(seconds: 1),
        Time(seconds: 2),
        Time(seconds: 5),
        Time(seconds: 10),
        Time(seconds: 20),
        Time(seconds: 30),
        Time(seconds: 60),
        Time(seconds: 120),
        Time(seconds: 180),
        Time(seconds: 240),
        Time(seconds: 300),
    ]
}
