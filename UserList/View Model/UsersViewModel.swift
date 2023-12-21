//
//  UsersViewModel.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import Foundation

class UsersViewModel {
    
    var reloadTableView: (() -> Void)?
    
    var userCellViewModels = [UserCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func getUsersAndUserCellViewModels() async {
        let users = await NetworkUtils.standard.getUsers()
        var cellViewModels = [UserCellViewModel]()
        for user in users {
            cellViewModels.append(createCellViewModel(user: user))
        }
        self.userCellViewModels = cellViewModels
    }
    
    func createCellViewModel(user: User) -> UserCellViewModel {
        if let id = user.userID, let name = user.name, let email = user.email, let gender = user.gender, let status = user.status {
            return UserCellViewModel(id: id, name: name, email: email, gender: gender, status: status)
        } else {
            return UserCellViewModel()
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> UserCellViewModel {
        return userCellViewModels[indexPath.row]
    }
    
}
