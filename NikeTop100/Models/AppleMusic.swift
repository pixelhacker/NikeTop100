//
//  AppleMusic.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import Foundation

struct AppleMusic: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Album]
    let title: String
}

struct Album: Decodable {
    let artistName: String
    let artworkUrl100: String
    let copyright: String
    let genres: [Genre]
    let name: String
    let releaseDate: String
    let url: String
}

struct Genre: Decodable {
    let name: String
}
