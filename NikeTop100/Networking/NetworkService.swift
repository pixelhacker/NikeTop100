//
//  NetworkService.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class NetworkingService {
    static let shared = NetworkingService()
	private let imageCache = NSCache<NSString, UIImage>()

    
    func fetchAlbums(totalAlbums: Int = 100, completion: @escaping ([Album]?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/\(totalAlbums)/non-explicit.json"
		guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch albums ", err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let appleMusic = try JSONDecoder().decode(AppleMusic.self, from: data)
                DispatchQueue.main.async {
                    completion(appleMusic.feed.results, nil)
                }
            } catch let jsonError {
                print("Error decoding JSON : ", jsonError)
            }
            }.resume()
    }
	
	func fetchImage(url: URL, completion: @escaping(UIImage?) -> Void ) {
		URLSession.shared.dataTask(with: url) { (data, resp, err) in
			if let err = err {
				print("Failed to fetch albums ", err)
                completion(nil)
                return
            }
			
			guard let data = data, let image = UIImage(data: data) else {
				print("Failure")
				completion(nil)
                return
			}
			completion(image)
		}.resume()
	}
	
	func fetchCachedImage(albumUrl: URL, completion: @escaping (UIImage?) -> Void) {
		if let cachedImage = imageCache.object(forKey: albumUrl.absoluteString as NSString) {
			completion(cachedImage)
		} else {
			fetchImage(url: albumUrl) { image in
				guard let image = image else {
					print("Failure")
					completion(nil)
					return
				}
				
				self.imageCache.setObject(image, forKey: albumUrl.absoluteString as NSString)
				completion(image)
			}
		}
	}
}
