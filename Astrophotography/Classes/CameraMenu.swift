//
//  CameraMenu.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import SwiftUI

struct CameraMenu: View {
    
    public var action: (Camera) -> Void
    
    public var body: some View {
        Menu("Choose..", systemImage: "camera") {
            ForEach(Camera.all) {
                camera in
                Button("\(camera.brand) - \(camera.name)", action: { self.action(camera) })
            }
        }
        .frame(maxWidth: 120)
    }
}

#Preview {
    CameraMenu {
        _ in
    }
    .padding()
}
