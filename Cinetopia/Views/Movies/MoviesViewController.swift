//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Pedro Delmondes  on 13/08/2024.
//

import UIKit

protocol MoviesViewControllerToPresenterProtocol: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

class MoviesViewController: UIViewController {

    private var presenter: MoviesPresentersToViewControllerProtocol?
    private var mainView: MoviesView?
    
    init(view: MoviesView,presenter: MoviesPresentersToViewControllerProtocol) {
        super.init(nibName: "", bundle: nil)
        self.presenter = presenter
        self.mainView = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setViewController(self)
        presenter?.viewDidLoad()
        setupNavigationBar()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
//    @objc private func hideKeyboard() {
//        searchBar.resignFirstResponder()
//    }
    
    private func setupNavigationBar() {
        title = "Filmes Favoritos"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = mainView?.searchBar
    }

}
//MARK: - Extensions

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

//#Preview {
//    MoviesViewController()
//}

extension MoviesViewController: MoviesViewControllerToPresenterProtocol {
    func didSelectMovie(_ movie: Movie) {
        let detailVC = MovieDetailsViewController(movie: movie)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
