//
//  GHFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-31.
//

import UIKit

class GHFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func setImage(from urlString: String) {
//        NetworkManager.shared.downloadImage(from: urlString) { [weak self] image in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//    }
    
    func setImage(from urlString: String) {
        Task {
            image = await NetworkManager.shared.downloadImage(from: urlString) ?? placeholderImage
        }
    }
    
//    func downloadImage(from urlString: String) {
//
//        let cacheKey = NSString(string: urlString)
//        if let image = cache.object(forKey: cacheKey) {
//            self.image = image
//            return
//        }
//
//        guard let url = URL(string: urlString) else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            guard let self = self else { return }
//            if error != nil { return }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
//            guard let data = data else { return }
//
//            guard let image = UIImage(data: data) else { return }
//            self.cache.setObject(image, forKey: cacheKey)
//
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        task.resume()
//    }

}
