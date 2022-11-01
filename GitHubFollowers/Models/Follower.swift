//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-10-27.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
