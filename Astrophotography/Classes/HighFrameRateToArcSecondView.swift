//
//  HighFrameRateToArcSecondView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 24/12/24.
//

import SwiftUI

struct HighFrameRateToArcSecondView: View {
    @State private var focalLength: Double = 0
    @State private var aperture: Double = 0
    @State private var pixelSize: Double = 0
    @State private var highFrameRate: Double = 0
    
    private var arcSecPerPixel: (value: Double, description: String) {
        guard self.focalLength > 0, self.pixelSize > 0, self.highFrameRate >= 0 else {
            return (0, "--")
        }
        
        let arcSec = (206.2648 * self.pixelSize) / self.focalLength
        
        return (arcSec, String(format: "%.02f", arcSec))
    }
    
    private var arcSec: String {
        guard self.focalLength > 0, self.pixelSize > 0, self.highFrameRate >= 0 else {
            return "--"
        }
        
        return String(format: "%.02f", 116 / self.aperture)
    }
    
    private var maxResolutioon: String {
        guard self.aperture > 0 else {
            return "--"
        }
        
        return String(format: "%.02f", 116 / self.aperture)
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "camera.metering.multispot")
                Text("High Frame Rate To Arc Seconds").font(.title)
            }
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Focal Length:").foregroundStyle(.secondary)
                    TextField("", value: $focalLength, format: .number).textFieldStyle(.roundedBorder)
                    TelescopeMenu() {
                        self.focalLength = $0.focalLength
                        self.aperture = $0.aperture
                    }
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Aperture:").foregroundStyle(.secondary)
                    TextField("", value: $aperture, format: .number).textFieldStyle(.roundedBorder)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Max Resolution in Arc:").foregroundStyle(.secondary)
                    Text(self.maxResolutioon)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Aperture:").foregroundStyle(.secondary)
                    TextField("", value: $aperture, format: .number).textFieldStyle(.roundedBorder)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Pixel Size: ").foregroundStyle(.secondary)
                    TextField("", value: $pixelSize, format: .number).textFieldStyle(.roundedBorder)
                    CameraMenu() {
                        self.pixelSize = $0.pixelSize
                    }
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Arc Second Per Pixel:").foregroundStyle(.secondary)
                    Text(self.arcSecPerPixel.description)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("High Frame Rate: ").foregroundStyle(.secondary)
                    TextField("", value: $highFrameRate, format: .number).textFieldStyle(.roundedBorder)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Star Diameter in Arc Second: ").foregroundStyle(.secondary)
                    Text(self.arcSec)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Exceptional Seeing: ").foregroundStyle(.secondary)
                    SamplingView(seing: .good, resolution: self.arcSecPerPixel.value)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Good Seeing: ").foregroundStyle(.secondary)
                    SamplingView(seing: .ok, resolution: self.arcSecPerPixel.value)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Ok Seeing: ").foregroundStyle(.secondary)
                    SamplingView(seing: .ok, resolution: self.arcSecPerPixel.value)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Poor Seeing: ").foregroundStyle(.secondary)
                    SamplingView(seing: .poor, resolution: self.arcSecPerPixel.value)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Very Poor Seeing: ").foregroundStyle(.secondary)
                    SamplingView(seing: .veryPoor, resolution: self.arcSecPerPixel.value)
                }
                .frame(minHeight: 20)
            }
        }
    }
}

#Preview {
    HighFrameRateToArcSecondView().padding()
}
