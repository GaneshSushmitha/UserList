//
//  UserModel.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import Foundation

enum Gender: String, Codable {
    case male, female
    case unknown
    
    var description: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .unknown:
            return "NA"
        }
    }
}

enum UserStatus: String, Codable {
    case active, inactive
    case unknown
    
    var description: String {
        switch self {
        case .active:
            return "Active"
        case .inactive:
            return "Inactive"
        case .unknown:
            return "NA"
        }
    }
}

struct User: Codable {
    let userID: Int?
    let name: String?
    let email: String?
    let gender: Gender?
    let status: UserStatus?
    
    init(name: String, email: String, gender: Gender) {
        self.name = name
        self.email = email
        self.gender = gender
        self.userID = nil
        self.status = UserStatus.active
    }
    
    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case name
        case email
        case gender
        case status
    }
}

