//
//  UserTableViewCell.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var userCellViewModel: UserCellViewModel = UserCellViewModel() {
        didSet {
            idLabel.text = userCellViewModel.formatIntToString(userCellViewModel.id)
            nameLabel.text = userCellViewModel.name
            emailLabel.text = userCellViewModel.email
            genderLabel.text = userCellViewModel.formatEnumToString(userCellViewModel.gender)
            statusLabel.text = userCellViewModel.formatEnumToString(userCellViewModel.status)
        }
    }
}
