//
//  Quote.swift
//  Flucom
//
//  Created by Tran Luan on 15/7/25.
//

//{
//    "quote_id": 115,
//    "quote": "I'm sorry, what were you asking me? Oh, yes, that stupid plastic container I asked you to buy.",
//    "character": "Walter White",
//    "production": "Breaking Bad",
//    "episode": 102
//}

struct Quote: Decodable {
    let quote: String
    let character: String
}
