//
//  AddUserViewController.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import Foundation
import UIKit

class AddUserViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    lazy var viewModel = AddUserViewModel()
    
    override func viewDidLoad() {
        navigationItem.title = "Add User"
        super.viewDidLoad()
    }
    
    func updateViewModel() {
        viewModel.name = nameTextField.text ?? "NA"
        viewModel.email = emailTextField.text ?? "NA"
        viewModel.gender = genderTextField.text ?? "NA"
        viewModel.handleSuccess = {
            DispatchQueue.main.async() { // To supress warning
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func addPressed() {
        updateViewModel()
        Task {
            await viewModel.addUser()
        }
    }
}
