//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-27.
//

import UIKit

class NetworkManager {
    //every network manager will have this variable
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
                        //key,     value
    let cache = NSCache<NSString, UIImage>()
    
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
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage) -> ()) {
            let cacheKey = NSString(string: urlString)
            
            if let image = cache.object(forKey: cacheKey) {
                completed(image)
                return
            }
            
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else { return }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                guard let data = data else { return }
                
                guard let image = UIImage(data: data) else { return }
                self.cache.setObject(image, forKey: cacheKey)
                
                DispatchQueue.main.async { completed(image) }
            }
            
            task.resume()
        }
}
