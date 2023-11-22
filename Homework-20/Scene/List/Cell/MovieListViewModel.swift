//
//  MovieListViewModel.swift
//  Homework-20
//
//  Created by salome on 21.11.23.
//

import UIKit

import Foundation

protocol MovieListViewModelDelegate: AnyObject {
    func moviesFetched(_ movies: [Movie])
    func showError (_ error: Error)
}

final class MovieListViewModel{
    private var movies: [Movie]?
    
    weak var delegate: MovieListViewModelDelegate?
    
    func viewDidLoad() {
        fetchMovies()
        
    }
    
    private func fetchMovies() {
        NetworkManager.shared.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.delegate?.moviesFetched(movies)
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
