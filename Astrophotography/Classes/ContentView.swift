//
//  ContentView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import SwiftUI

public struct ContentView: View {
    public var body: some View {
        VStack {
            HighFrameRateToArcSecondView()
            Divider().padding(.vertical)
            ExposureView()
            Divider().padding(.vertical)
            MagnificationView()
        }
        .padding()
        .frame(minWidth: 600)
    }
}

#Preview {
    ContentView()
}
