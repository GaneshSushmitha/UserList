//
//  AddUserViewModel.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import Foundation

class AddUserViewModel {
    var name: String
    var email: String
    var gender: String
    
   
    var handleSuccess: (() -> Void)?
    var handleFailure: (() -> Void)?
    
    var success: Bool {
        willSet {
            if newValue {
                handleSuccess?()
            } else {
                handleFailure?()
            }
        }
    }
    
    init(name: String, email: String, gender: String) {
        self.name = name
        self.email = email
        self.gender = gender
        self.success = false
        self.handleSuccess = nil
        self.handleFailure = nil
    }
    
    init() {
        self.name = "NA"
        self.email = "NA"
        self.gender = "NA"
        self.success = false
        self.handleSuccess = nil
        self.handleFailure = nil
    }
    
    func createUser() -> User {
        return User(name: self.name, email: self.email, gender: Gender(rawValue: self.gender) ?? .unknown)
    }
    
    func addUser() async {
        if await NetworkUtils.standard.addUser(user: createUser()) {
            success = true
        } else {
            print("Error while adding user")
        }
    }
}
