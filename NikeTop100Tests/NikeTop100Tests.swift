//
//  NikeTop100Tests.swift
//  NikeTop100Tests
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import XCTest
@testable import NikeTop100

class NikeTop100Tests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
	
	func testFetch100Albums() {
		NetworkingService.shared.fetchAlbums(totalAlbums: 100) { (albums, _) in
			XCTAssertTrue(albums?.count == 100)
		}
	}
	
	func testFetch50Albums() {
		NetworkingService.shared.fetchAlbums(totalAlbums: 50) { (albums, _) in
			XCTAssertTrue(albums?.count == 50)
		}
	}
	
	func testDateFormatterConvertsCorrectly() {
		let popGenre = Genre(name: "Pop")
		let album = Album(artistName: "", artworkUrl100: "", copyright: "", genres: [popGenre], name: "", releaseDate: "2020-03-23", url: "")
		let albumVM = AlbumViewModel(album: album)
		
		let date = albumVM.releaseDate
		let expectedDate = "Mar 23, 2020"
		
		XCTAssertEqual(date, expectedDate)
	}
}
