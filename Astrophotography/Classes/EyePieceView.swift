//
//  EyePieceView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 24/12/24.
//

import SwiftUI

public struct EyePieceView: View {
    
    public var action: (EyePiece) -> Void
    
    public var body: some View {
        Menu("Choose...", systemImage: "eyeglass") {
            ForEach(EyePiece.all) { eyepiece in
                Button("\(eyepiece.brand) - \(eyepiece.name) - \(eyepiece.focalLength)mm", action: { self.action(eyepiece) })
            }
        }
        .frame(maxWidth: 120)
    }
}

#Preview {
    EyePieceView { _ in
    }.padding()
}
