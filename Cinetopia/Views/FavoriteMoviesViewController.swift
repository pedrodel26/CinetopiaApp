//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 09/09/2024.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    
    //MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 27, bottom: 10, right: 27)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteMovieCollectionViewCell")
        collectionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoriteCollectionReusableView")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .background
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    //MARK: - Class methods
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoriteMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManager.shared.favoritesMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCollectionViewCell", for: indexPath) as? FavoriteMovieCollectionViewCell else {
            fatalError("error to create FavoriteMovieCollectionViewCell")
        }
        
        let currentMovie = MovieManager.shared.favoritesMovie[indexPath.item]
        cell.setupView(currentMovie)
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FavoriteCollectionReusableView", for: indexPath) as? FavoriteCollectionReusableView else {
                fatalError("error to create collection header")
            }
            
            headerView.setupTitle("Meus Filmes Favoritos")
            
            return headerView
        }
        return UICollectionReusableView()
    }
    
}
//MARK: - Extensions

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
     }
}

extension FavoriteMoviesViewController: FavoriteMovieCollectionViewCellDelegate {
    func didSelectedFavoriteButton(_ sender: UIButton) {
        
        guard let cell = sender.superview as? FavoriteMovieCollectionViewCell else {
            return
        }
        
        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        
        let selectedMovie = MovieManager.shared.favoritesMovie[indexPath.item]
        selectedMovie.changeSelectedStatus()
        
        MovieManager.shared.remove(selectedMovie)
        collectionView.reloadData()
    }
}



#Preview {
    FavoriteMoviesViewController()
}
