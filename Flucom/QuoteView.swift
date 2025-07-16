//
//  QuoteView.swift
//  Flucom
//
//  Created by Tran Luan on 16/7/25.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    
    let show: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height * 1.2)
                
                VStack {
                    Text("\"\(vm.quote.quote)\"")
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
