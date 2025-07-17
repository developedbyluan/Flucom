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
                FetchView(show: Constants.bbName)
            }
            
            Tab(Constants.bcsName, systemImage: "gear") {
                FetchView(show: Constants.bcsName)
            }
            
            Tab(Constants.ecName, systemImage: "car") {
                FetchView(show: Constants.ecName)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
