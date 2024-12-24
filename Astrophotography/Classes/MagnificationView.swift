//
//  MagnificationView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 24/12/24.
//

import SwiftUI

public struct MagnificationView: View {
    
    @State private var apperture: Double = 0
    @State private var focalLength: Double = 0
    @State private var eyepieceFocalLength: Double = 0
    @State private var eyepieceFieldOfView: Double = 0
    @State private var barlow: Double = 0
    
    private var maximumMagnification: String {
        guard self.apperture > 0 else {
            return "--"
        }
        
        return String(format: "%.02f", min(350, 2.5 * self.apperture))
    }
    
    private var magnification: String {
        guard self.focalLength > 0, self.eyepieceFocalLength > 0 else {
            return "--"
        }
        
        let magnification = self.barlow > 0 ? self.focalLength / (self.eyepieceFocalLength / self.barlow) : self.focalLength
        
        return String(format: "%.02f", magnification)
    }
    
    private var fieldOfView: String {
        guard self.eyepieceFocalLength > 0, self.eyepieceFieldOfView > 0, self.focalLength > 0 else {
            return "--"
        }
        let eyepieceFocalLength = self.barlow > 0 ? self.eyepieceFocalLength / self.barlow : self.eyepieceFocalLength
        
        return String(format: "%.02f", self.eyepieceFieldOfView / (self.focalLength / eyepieceFocalLength))
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "magnifyingglass.circle")
                Text("Magnification").font(.title)
            }
            
            Grid(alignment: .leading) {
                GridRow {
                    Text("Focal Length: ").foregroundStyle(.secondary)
                    TextField("", value: $focalLength, format: .number).textFieldStyle(.roundedBorder)
                    TelescopeMenu() {
                        self.focalLength = $0.focalLength
                        self.apperture = $0.aperture
                    }
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Aperture: ").foregroundStyle(.secondary)
                    TextField("", value: $apperture, format: .number).textFieldStyle(.roundedBorder)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Maximum Magnification: ").foregroundStyle(.secondary)
                    Text(self.maximumMagnification)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Eyepiece Focal Length: ").foregroundStyle(.secondary)
                    TextField("", value: $eyepieceFocalLength, format: .number).textFieldStyle(.roundedBorder)
                    EyePieceView() {
                        self.eyepieceFocalLength = Double($0.focalLength)
                        self.eyepieceFieldOfView = Double($0.fieldOfView)
                    }
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Eyepiece Field Of View:").foregroundStyle(.secondary)
                    TextField("", value: $eyepieceFieldOfView, format: .number).textFieldStyle(.roundedBorder)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Barlow:").foregroundStyle(.secondary)
                    TextField("", value: $eyepieceFieldOfView, format: .number).textFieldStyle(.roundedBorder)
                    BarMenu() {
                        self.barlow = Double($0.maginification)
                    }
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Magnification:").foregroundStyle(.secondary)
                    Text(self.magnification)
                }
                .frame(minHeight: 20)
                
                GridRow {
                    Text("Field of View:").foregroundStyle(.secondary)
                    Text(self.fieldOfView)
                }
                .frame(minHeight: 20)
            }
        }
    }
}

#Preview {
    MagnificationView().padding()
}
