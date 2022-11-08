//
//  GHFError.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-06.
//

import Foundation

enum GHFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data receieved from the server was invalid. Please try again."
}
