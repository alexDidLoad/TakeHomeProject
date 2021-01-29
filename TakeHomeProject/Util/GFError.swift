//
//  GFError.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/26/21.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet"
    case invalidResponse = "Invalid reponse from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
    case unableToFavorite = "There was an error favoriting this user. Please try again"
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them"
}
