//
//  MoviesInteractors.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 20/09/2024.
//

import Foundation

protocol MoviesPresentersToInteractorProtocol: AnyObject {
    func fetchMovies() async throws -> [Movie]
}

class MoviesInteractors: MoviesPresentersToInteractorProtocol {
    
    //MARK: - Attributes
    private var movieService: MovieService = MovieService()
    
    
    //MARK: - Class Methods
    
    func fetchMovies() async throws -> [Movie] {
        do {
            let movies = try await movieService.getMovies()
            return movies
        } catch (let error) {
            throw error
        }
    }
    
    
}
