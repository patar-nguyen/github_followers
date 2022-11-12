//
//  FavoritesListViewController.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-24.
//

import UIKit

class FavoritesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        PersistenceManger.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }

}
