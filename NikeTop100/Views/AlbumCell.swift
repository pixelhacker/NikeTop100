//
//  AlbumCell.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
	public var albumViewModel: AlbumViewModel? {
        didSet {
            albumNameLabel.text = albumViewModel?.albumName
            artistNameLabel.text = albumViewModel?.artistName
            
			guard let albumImagePath = albumViewModel?.albumImage, let albumUrl = URL(string: albumImagePath) else { return }
			NetworkingService.shared.fetchCachedImage(albumUrl: albumUrl) { image in
				DispatchQueue.main.async {
					self.albumImageView.image = image
				}
			}
		}
    }
    
    // MARK: - Private properties
    
	private lazy var albumImageView: UIImageView = {
        let iv = UIImageView()
		iv.image = #imageLiteral(resourceName: "no-album-artwork")
        iv.backgroundColor = UIColor(named: "top100DarkGray")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = UIColor(named: "top100DarkGray")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.textColor = UIColor(named: "top100DarkGray")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        compose()
        constrain()
    }
    
    private func compose() {
        accessoryType = .disclosureIndicator
        backgroundColor = UIColor(named: "demoWhite")
        
        contentView.addSubview(albumImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(artistNameLabel)
    }
    
    private func constrain() {
        let albumBottomConstraint = albumImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        albumBottomConstraint.priority = .init(999)
		
		albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
		albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		albumImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
		albumImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		albumBottomConstraint.isActive = true
		
		albumNameLabel.topAnchor.constraint(equalTo: albumImageView.topAnchor, constant: 0).isActive = true
		albumNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 10).isActive = true
		albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
		
		artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10).isActive = true
		artistNameLabel.leadingAnchor.constraint(equalTo: albumNameLabel.leadingAnchor).isActive = true
		artistNameLabel.trailingAnchor.constraint(equalTo: albumNameLabel.trailingAnchor).isActive = true
    }
}
