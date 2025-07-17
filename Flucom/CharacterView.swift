//
//  CharacterView.swift
//  Flucom
//
//  Created by Tran Luan on 15/7/25.
//

import SwiftUI

struct CharacterView: View {
    let character: Char
    let show: String
    
    var body: some View {
        GeometryReader { geometry in // top-left
            ZStack(alignment: .top) {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFit()
                
                ScrollView {
                    AsyncImage(url: character.images[0]) { image in
                           image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                }
                .border(.blue, width: 7)
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: "Breaking Bad")
}
