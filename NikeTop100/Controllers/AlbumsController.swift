//
//  AlbumsController.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class AlbumsController: UITableViewController {

	// MARK: - Private properties
    
	private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var albumArray = [Album]()
    private let albumCellId = "albumCellId"
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.estimatedRowHeight = 120.0
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.register(AlbumCell.self, forCellReuseIdentifier: albumCellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets.zero
		tableView.separatorStyle = .none
		
		setupNavigationItems()
        fetchData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		activityIndicator.center = view.center
		view.addSubview(activityIndicator)
	}
	
	private func fetchData() {
		//TODO: given more time I would implement UITableViewDataSourcePrefetching
		activityIndicator.startAnimating()
        NetworkingService.shared.fetchAlbums(totalAlbums: 100) { (albums, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            guard let albums = albums else { return }
			self.activityIndicator.stopAnimating()
			self.tableView.separatorStyle = .singleLine
            self.albumArray = albums
            self.tableView.reloadData()
        }
    }
	
	// MARK: - Navigation
    
    private func setupNavigationItems() {
		navigationItem.title = AppleMusicStrings.albumNavigationTitle
    }
}

extension AlbumsController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: albumCellId, for: indexPath) as? AlbumCell else {
            return UITableViewCell()
        }
        
        cell.albumViewModel = AlbumViewModel(album: albumArray[indexPath.row])
        cell.layoutMargins = UIEdgeInsets.zero
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumVM = AlbumViewModel(album: albumArray[indexPath.row])
        let albumDetailController = AlbumDetailController(albumViewModel: albumVM)
        
        navigationController?.pushViewController(albumDetailController, animated: true)
		navigationController?.navigationBar.tintColor = .black
		navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }
}
