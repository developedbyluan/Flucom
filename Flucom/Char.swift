//
//  Char.swift
//  Flucom
//
//  Created by Tran Luan on 15/7/25.
//

// https://breaking-bad-api-six.vercel.app/api/characters?name=Jesse+Pinkman

import Foundation

struct Char: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    var death: Death? // nil initially
}
