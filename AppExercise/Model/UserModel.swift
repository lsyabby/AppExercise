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
