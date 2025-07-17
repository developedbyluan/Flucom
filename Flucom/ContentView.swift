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
                QuoteView(show: "Breaking Bad")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Tab 2", systemImage: "gear") {
                QuoteView(show:"Better Call Saul")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
            
            Tab("Tab 3", systemImage: "car") {
                QuoteView(show: "El Camino")
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
