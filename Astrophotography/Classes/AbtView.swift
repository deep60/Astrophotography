//
//  AbtView.swift
//  Astrophotography
//
//  Created by P Deepanshu on 21/12/24.
//

import SwiftUI

public struct AbtView: View {
    public var body: some View {
        HStack {
            Image(nsImage: NSImage(named: NSImage.applicationIconName) ?? NSImage())
                .resizable()
                .frame(width: 200, height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("AstroPhotography Tools").font(.largeTitle)
                Text(self.version).font(.title3).foregroundStyle(.secondary)
                Spacer()
                Text(self.copyright).foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.trailing)
        }
        .frame(maxHeight: 200)
    }
    
    private var copyright: String {
        Bundle.main.object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String ?? "--"
    }
    
    private var version: String {
        
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            return "--"
        }
        
        if let bundleVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String {
            return "\(version) (\(bundleVersion))"
        }
        
        return version
    }
}

#Preview {
    AbtView().padding()
}
