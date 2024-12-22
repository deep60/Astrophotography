//
//  ExposureView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 22/12/24.
//

import SwiftUI

struct ExposureView: View {
    
    @State private var f1: Double = 0
    @State private var t1: Double = 0
    @State private var f2: Double = 0
    
    private var t2: (value: Double, description: String) {
        guard self.t1 > 0, self.f1 > 0, self.f2 > 0 else {
            return (0, "--")
        }
        
        let t2 = self.t1 * (self.f2 * self.f2) / (self.f1 * self.f1)
        
        if t2 > 60 {
            return (t2, String(format: "%.2f - %.02f minutes", t2, t2 / 60))
        }
        
        return (t2, String(format: "%.02f", t2))
    }
    
    private var ratio: String {
        guard self.t1 > 0, self.t2.value > 0 else {
            return "--"
        }
        
        return String(format: "%.02fx", self.t2.value / self.t1)
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "camera.fill")
                Text("Exposure Time Eqivalent").font(.title)
            }
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Focal Ratio 1: ").foregroundStyle(.secondary)
                    TextField("", value: $f1, format: .number).textFieldStyle(.roundedBorder)
                    TelescopeMenu() {
                        self.t1 = $0.focalRatio
                    }
                }
                .frame(minHeight: 20)
            }
        }
    }
}

#Preview {
    ExposureView()
}
