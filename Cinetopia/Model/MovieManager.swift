//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 15/09/2024.
//

// MARK: - Singleton Method

import Foundation

class MovieManager {
    
    static let shared = MovieManager()
    var favoritesMovie: [Movie] = []
    
    //MARK: - Init
    
    private init() { }
    
    func add(_ movie: Movie) {
        if favoritesMovie.contains(where: { $0.id == movie.id }) {
            remove(movie)
        } else {
            favoritesMovie.append(movie)
        }
    }
    
    func remove(_ movie: Movie) {
        if let index = favoritesMovie.firstIndex(where: { $0.id == movie.id }) {
            favoritesMovie.remove(at: index)
        }
    }
}
