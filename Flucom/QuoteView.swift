//
//  QuoteView.swift
//  Flucom
//
//  Created by Tran Luan on 16/7/25.
//

import SwiftUI

struct QuoteView: View {
    let show: String
    
    var body: some View {
        Text(show)
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
