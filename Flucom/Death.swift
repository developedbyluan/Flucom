//
//  Death.swift
//  Flucom
//
//  Created by Tran Luan on 15/7/25.
//

// https://breaking-bad-api-six.vercel.app/api/deaths

import Foundation

struct Death: Decodable {
    let character: String
    let image: URL
    let details: String
    let lastWords: String
}
