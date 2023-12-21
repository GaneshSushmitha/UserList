//
//  UserCellViewModel.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

struct UserCellViewModel {
    let id: Int
    let name: String
    let email: String
    let gender: Gender
    let status: UserStatus
    
    init(id: Int, name: String, email: String, gender: Gender, status: UserStatus) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status
    }
    
    init() {
        self.id = -1008
        self.name = "NA"
        self.email = "NA"
        self.gender = .unknown
        self.status = .unknown
    }
    
    func formatEnumToString(_ value: Gender) -> String {
        return value.description
    }
    
    func formatEnumToString(_ value: UserStatus) -> String {
        return value.description
    }
    
    func formatIntToString(_ value: Int) -> String {
        return String(value)
    }
}
