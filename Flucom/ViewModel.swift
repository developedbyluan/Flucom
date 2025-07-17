//
//  ViewModel.swift
//  Flucom
//
//  Created by Tran Luan on 16/7/25.
//

// (theory) ViewModel: https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/learn/lecture/47946049?start=27#notes
// (implementation) ViewModel: https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/learn/lecture/47946049?start=277#notes

import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Char
    var episode: Episode?
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
    
        let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        character = try! decoder.decode(Char.self, from: characterData)
        
        let episodeData = try! Data(contentsOf: Bundle.main.url(forResource: "sampleepisode", withExtension: "json")!)
        episode = try! decoder.decode(Episode.self, from: episodeData)
    }
    
    // run after users taps generate random quote button
    func getQuoteData(for show: String) async {
        status = .fetching
        
        do {
            quote = try await fetcher.fetchQuote(from: show)
            
            character = try await fetcher.fetchCharacter(quote.character)
            
            character.death = try await fetcher.fetchDeath(for: character.name)
            
            status = .success
        } catch {
            // there's an invisible error value in the catch block
            status = .failed(error: error)
        }
    }
    
    func getEpisodeData(for show: String) async {
        status = .fetching
        
        do {
            if let unwrappedEpisode = try await fetcher.fetchEpisode(from: show) {
                episode = unwrappedEpisode
            }
            
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
}
