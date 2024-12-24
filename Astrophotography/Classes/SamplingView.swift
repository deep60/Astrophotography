//
//  SamplingView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 24/12/24.
//

import SwiftUI

public struct SamplingView: View {
    
    public enum Seing {
        case exceptioonal
        case good
        case ok
        case poor
        case veryPoor
    }
    
    public enum Sampling {
        case over
        case good
        case under
    }
    
    public var seing: Seing
    public var resolution: Double
    
    private var range: (min: Double, max: Double) {
        switch self.seing {
        case .exceptioonal: return (0.00, 0.50)
        case .good: return (0.33, 1.00)
        case .ok: return (0.67, 2.00)
        case .poor: return (1.33, 2.50)
        case .veryPoor: return (1.67, Double.greatestFiniteMagnitude)
        }
    }
    
    private var sampling: Sampling {
        if self.resolution < self.range.min {
            return .over
        } else if self.resolution > self.range.max {
            return .under
        } else {
            return .good
        }
    }
    
    private var label: String {
        switch self.sampling {
        case .over: return "Over-Sampled"
        case .good: return "Good"
        case .under: return "Under-Sampled"
        }
    }
    
    private var description: String {
        if self.seing == .veryPoor {
            return String(format: "%.02f - ...", self.range.min)
        } else {
            return String(format: "%.02f - %.02f", self.range.min, self.range.max)
        }
    }
    
    private var icon: String {
        switch self.sampling {
        case .over:
            return "arrow.up.circle.fill"
        case .good:
            return "checkmark.circle.fill"
        case .under:
            return "arrow.down.circle.fill"
        }
    }
    
    private var color: Color {
        switch self.sampling {
        case .over:
            return .orange
        case .good:
            return .green
        case .under:
            return .orange
        }
    }
    
    public var body: some View {
        if self.resolution > 0 {
            HStack(alignment: .center) {
                Image(systemName: self.icon).foregroundStyle(self.color)
                Text(self.label).foregroundStyle(self.color)
                Text(self.description).foregroundStyle(.secondary).font(.footnote)
            }
        } else {
            Text("--")
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        SamplingView(seing: .ok, resolution: 3.0)
        SamplingView(seing: .ok, resolution: 1.5)
        SamplingView(seing: .ok, resolution: 0.5)
        SamplingView(seing: .ok, resolution: 0.0)
    }
    .padding()
}
