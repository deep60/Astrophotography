//
//  TimeMenuView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 23/12/24.
//

import SwiftUI

public struct TimeMenuView: View {
    public var action: (Time) -> Void
    
    public var body: some View {
        Menu("Choose...", systemImage: "clock") {
            ForEach(Time.all) { time in
                Button("\(time.description)", action: { self.action(time) })
            }
        }
        .frame(maxWidth: 120)
    }
}

#Preview {
    TimeMenuView { _ in
    }.padding()
}
