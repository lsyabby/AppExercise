//
//  UserModel.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import Foundation

struct User: Codable {
    let avatarUrl: String
    let login: String
    let isAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login
        case isAdmin = "site_admin"
    }
}


struct Detail: Codable {
    let avatarUrl: String
    let name: String
    let bio: String?
    let login: String
    let isAdmin: Bool
    let location: String?
    let blog: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name
        case bio
        case login
        case isAdmin = "site_admin"
        case location
        case blog
    }
}
