//
//  User.swift
//  TakeHomeProject
//
//  Created by Alexander Ha on 1/26/21.
//

import Foundation

struct User: Codable {
        
    let login           : String
    let avatarUrl       : String
    var name            : String?
    var location        : String?
    var bio             : String?
    let publicRepos     : Int
    let publicGists     : Int
    let htmlUrl         : String
    let followers       : Int
    let following       : Int
    let createdAt       : Date
}
