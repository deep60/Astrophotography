//
//  TelescopeMenu.swift
//  Astrophotography
//
//  Created by P Deepanshu on 22/12/24.
//

import SwiftUI

public struct TelescopeMenu: View
{
    public var action: ( Telescope ) -> Void

    public var body: some View
    {
        Menu("Choose..", systemImage: "dot.key") {
            ForEach(Telescope.all) { telescope in
                Button( "\( telescope.brand ) - \( telescope.name) - \(telescope.origin)", action: { self.action( telescope ) } )
            }
        }
        .frame(maxWidth: 120)
    }
}

#Preview
{
    TelescopeMenu
    {
        _ in
    }
    .padding()
}

