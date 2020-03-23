//
//  AlbumDetailController.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class AlbumDetailController: UIViewController {
	
	// MARK: - Private properties
	
	private var albumVM: AlbumViewModel

	private lazy var albumImageView: UIImageView = {
        let iv = UIImageView()
		iv.backgroundColor = UIColor(named: "top100DarkGray")
		iv.image = #imageLiteral(resourceName: "no-album-artwork")
        iv.contentMode = .scaleAspectFill
		iv.layer.shadowColor = UIColor.init(named: "demoLightGray")?.cgColor
		iv.layer.shadowOffset = CGSize(width: 0, height: 1.0)
		iv.layer.shadowOpacity = 0.5
		iv.layer.shadowRadius = 2.0
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
	
	private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "demoBlack")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var albumPageButton: BaseButton = {
        let button = BaseButton(title: AppleMusicStrings.albumButtonTitle)
        button.addTarget(self, action: #selector(showAlbumScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "demoRed")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "top100RegularGray")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var genreHeader: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = AppleMusicStrings.albumGenreHeader
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "top100MediumGray")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var releaseDateHeader: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = AppleMusicStrings.albumReleaseDateHeader
        label.textColor = UIColor(named: "top100Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "top100Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "top100White")
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(albumViewModel: AlbumViewModel) {
        self.albumVM = albumViewModel
        super.init(nibName: nil, bundle: nil)
        
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
		super.viewDidLoad()
		
		compose()
        constrain()
    }
	
	private func compose() {
		view.addSubview(scrollView)
		view.backgroundColor = UIColor(named: "top100White")
        scrollView.addSubview(containerView)
        
        containerView.addSubview(albumImageView)
        containerView.addSubview(albumNameLabel)
        containerView.addSubview(artistNameLabel)
        containerView.addSubview(releaseDateHeader)
        containerView.addSubview(releaseDateLabel)
        containerView.addSubview(genreHeader)
        containerView.addSubview(genreLabel)
        containerView.addSubview(copyrightLabel)
        containerView.addSubview(albumPageButton)
    }
	
	private func constrain() {
		let containerHeightConstraint = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        containerHeightConstraint.priority = .init(250)
		
		// Add scrollview to accomodate for smaller screen sizes and use if needed
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		
		containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		containerHeightConstraint.isActive = true
		
		albumImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
		albumImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
		albumImageView.heightAnchor.constraint(equalToConstant:200).isActive = true
		albumImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		
		albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30).isActive = true
		albumNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		albumNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
		
		artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 5).isActive = true
		artistNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		artistNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

		releaseDateHeader.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 30).isActive = true
		releaseDateHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		releaseDateHeader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

		releaseDateLabel.topAnchor.constraint(equalTo: releaseDateHeader.bottomAnchor, constant: 5).isActive = true
		releaseDateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		releaseDateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

		genreHeader.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 30).isActive = true
		genreHeader.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		genreHeader.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

		genreLabel.topAnchor.constraint(equalTo: genreHeader.bottomAnchor, constant: 5).isActive = true
		genreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		genreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
		
		copyrightLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 30).isActive = true
		copyrightLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
		copyrightLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true

		// Add vertical constraint to keep the albumPageButton 20 from the bottom of the
		// scrollview no matter what size device
		NSLayoutConstraint(item: albumPageButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: copyrightLabel, attribute: .bottom, multiplier: 1.0, constant: 30).isActive = true
		
		albumPageButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
		albumPageButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
		albumPageButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
		albumPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
	
	@objc func showAlbumScreen() {
		guard let url = URL(string: albumVM.iTunesUrl) else { return }
		
		if UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
    
    // MARK: - UI
    
	private func updateView() {
        albumNameLabel.text = albumVM.albumName
        artistNameLabel.text = albumVM.artistName
        releaseDateLabel.text = albumVM.releaseDate
        genreLabel.text = albumVM.genres
        copyrightLabel.text = albumVM.copyright
        
		navigationItem.title = albumVM.albumName
		
		guard let albumUrl = URL(string: albumVM.albumImage) else { return }
		NetworkingService.shared.fetchCachedImage(albumUrl: albumUrl) { image in
			DispatchQueue.main.async {
				self.albumImageView.image = image
			}
		}
	}
}
