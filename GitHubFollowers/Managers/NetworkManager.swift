//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-27.
//

import Foundation

class NetworkManager {
    //every network manager will have this variable
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {
    }
    
    func getFollowers(for username: String, page: Int, completed: @escaping (/*[Follower]?, ErrorMessage?*/Result<[Follower], GHFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(/*nil, .invalidUsername*/.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(/*nil, .unableToComplete*/.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(/*nil, .invalidResponse*/.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(/*nil, .invalidData*/.failure(.invalidData))
                return
            }
            
            do {
                //decoder is taking data from server and decoding it into our object
                //encoder is taking our object and converting it to data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(/*followers, nil*/.success(followers))
            } catch {
                //completed(nil, error.localizedDescription)
                completed(/*nil, .invalidData*/.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
}