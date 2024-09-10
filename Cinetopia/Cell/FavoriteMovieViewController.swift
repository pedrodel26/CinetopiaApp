//
//  FavoriteMovieViewController.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 09/09/2024.
//

import UIKit
import Kingfisher

class FavoriteMovieViewController: UICollectionViewCell {
    
    //MARK: - UI Components
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let iconImage = UIImage(systemName: "heart.fill")?.withTintColor(.buttonBackground, renderingMode: .alwaysOriginal)
        button.setImage(iconImage, for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Class Methods
    
    private func setupConstraints() {
        
        addSubview(moviePosterImageView)
        moviePosterImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
     
        addSubview(movieTitleLabel)
        movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(favoriteButton)
        favoriteButton.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    func setupView(_ movie: Movie) {
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        
        movieTitleLabel.text = movie.title
    }
    
    //MARK: - IBAction
    
    @objc
    func didTapFavoriteButton(_ sender: UIButton) {
        print("did tap favorite button")
    }
}
