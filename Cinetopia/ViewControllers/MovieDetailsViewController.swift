//
//  MovieDetailsViewController.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 19/08/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: movie.image))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 12
        imgView.layer.masksToBounds = true
        
        return imgView
    }()
    
    private lazy var rateUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação do usuário: \(movie.rate)"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()

    private lazy var sinopseMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(posterImageView)
        view.addSubview(rateUser)
        view.addSubview(sinopseMovie)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 192),
            posterImageView.heightAnchor.constraint(equalToConstant: 264),
            posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            
            rateUser.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            rateUser.centerXAnchor.constraint(equalTo: rateUser.centerXAnchor),
            rateUser.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rateUser.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            sinopseMovie.topAnchor.constraint(equalTo: rateUser.bottomAnchor, constant: 18),
            sinopseMovie.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            sinopseMovie.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)

        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
