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
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white) // white text even in light mode
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: vm.character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)

                        Text(vm.quote.character)
                    }
                    .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                    .clipShape(.rect(cornerRadius: 50))
                }
                .frame(width: geometry.size.width)
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
