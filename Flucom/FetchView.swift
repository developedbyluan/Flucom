//
//  FetchView.swift
//  Flucom
//
//  Created by Tran Luan on 16/7/25.
//

import SwiftUI

struct FetchView: View {
    let vm = ViewModel()
    
    let show: String
    
    @State var showCharacterInfo: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(show.removeCaseAndSpace())
                    .resizable()
                    .frame(width: geometry.size.width * 2.7, height: geometry.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 60)
                        
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .successQuote:
                            Text("\"\(vm.quote.quote)\"")
                                .minimumScaleFactor(0.5)
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
                                    .foregroundStyle(.white) // white text even in light mode
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                            .clipShape(.rect(cornerRadius: 50))
                            .onTapGesture {
                                showCharacterInfo.toggle()
                            }
                            
                        case .successEpisode:
                            EpisodeView(episode: vm.episode)
                            
                        case .failed(let error):
                            Text(error.localizedDescription)
                        }
                        
                        Spacer()
                    }
                    
                    // Buttons
                    HStack {
                        Button {
                            Task {
                                await vm.getQuoteData(for: show)
                            }
                            
                        } label: {
                            Text("Get Random Quote")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 7))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }
                        
                        Spacer()
                        
                        Button {
                            Task {
                                await vm.getEpisodeData(for: show)
                            }
                            
                        } label: {
                            Text("Get Random Episode")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 7))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer(minLength: 95)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
    }
}

#Preview {
    FetchView(show: Constants.ecName)
        .preferredColorScheme(.dark)
}
