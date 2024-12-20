//
//  AstrophotographyApp.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import SwiftUI

@main
struct AstrophotographyApp: App {
    
    @Environment(\.openWindow) private var openWindow
    
    public init() {}
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}
