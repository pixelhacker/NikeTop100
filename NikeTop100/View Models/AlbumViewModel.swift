//
//  AlbumViewModel.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    
    private let album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    var albumImage: String {
        return album.artworkUrl100
    }
    
    var artistName: String {
        return album.artistName
    }
    
    var albumName: String {
        return album.name
    }
    
    var copyright: String {
        return album.copyright
    }
    
    var genres: String {
        let genre = album.genres.map { $0.name }.sorted()
        return genre.joined(separator: ", ")
    }
    
    var releaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: album.releaseDate) else { return "" }
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
    
    var iTunesUrl: String {
        return album.url
    }
}
