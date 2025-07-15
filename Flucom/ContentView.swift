//
//  ContentView.swift
//  Flucom
//
//  Created by Tran Luan on 15/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Tab 1", systemImage: "globe") {
                Text("Tab 1")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Tab 2", systemImage: "gear") {
                Text("Tab 2")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
