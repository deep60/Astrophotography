//
//  BarMenu.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import SwiftUI

public struct BarMenu: View {
    
    public var action: (Barlow) -> Void
    
    public var body: some View {
        Menu ("Choose...", systemImage: "magnifyingglass"){
            ForEach (Barlow.all) {
                barlow in
                Button(barlow.description, action: { self.action(barlow) } )
            }
        }
        .frame(maxWidth: 120)
    }
}

#Preview {
    BarMenu {
        _ in
    }
    .padding()
}
