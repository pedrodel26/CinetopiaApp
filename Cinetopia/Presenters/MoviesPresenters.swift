//
//  MoviesPresenters.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 18/09/2024.
//

import UIKit

protocol MoviesPresentersToViewControllerProtocol: AnyObject {
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol)
    func viewDidLoad()
    func viewDidAppear()
}

protocol MoviesPresentersToViewProtocol: AnyObject {
    func didSelect(movie: Movie)
    func didSelectFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
}

class MoviesPresenters: MoviesPresentersToViewControllerProtocol {
    
    //MARK: - Attributes
    
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol
    private var interactor: MoviesPresentersToInteractorProtocol
    
    //MARK: - INIT
    
    init(view: MoviesViewProtocol, interactor: MoviesPresentersToInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    //MARK: - MoviesPresentersToViewControllerProtocol
    
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol) {
        self.controller = viewController
    }
    
    func viewDidLoad() {
        view.setPresenter(self)
        Task {
            await fetchMovies()
        }
    }
    
    func viewDidAppear() {
        view.reloadData()
    }
    
    //MARK: - Class Methods
    
    private func fetchMovies() async {
        do {
            let movies = try await interactor.fetchMovies()
            view.setupView(with: movies)
            view.reloadData()
        } catch (let error) {
            print(error)
        }
    }
}

extension MoviesPresenters: MoviesPresentersToViewProtocol {
    func didSelect(movie: Movie) {
        controller?.didSelectMovie(movie)
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectedStatus()
        MovieManager.shared.add(movie)
    }
    
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty {
            view.toggle(false)
        } else {
            view.toggle(true)
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased())
            })
        }
    }
    
    
}
