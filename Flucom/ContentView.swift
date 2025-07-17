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
            Tab(Constants.bbName, systemImage: "globe") {
                QuoteView(show: Constants.bbName)
            }
            
            Tab(Constants.bcsName, systemImage: "gear") {
                QuoteView(show: Constants.bcsName)
            }
            
            Tab(Constants.ecName, systemImage: "car") {
                QuoteView(show: Constants.ecName)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
