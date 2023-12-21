//
//  ListUserTableViewController.swift
//  UserList
//
//  Created by Sushmitha Ganesh on 12/20/23.
//

import UIKit

class ListUserTableViewController: UITableViewController {
   
    lazy var viewModel = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initViewModel()
    }
    
    @objc func showAddUserVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddUserViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpNavBar() {
        navigationItem.title = "User List"
        let rightBarButton = UIBarButtonItem(image: UIImage.add, style: .plain, target: self, action: #selector(showAddUserVC))
        navigationItem.setRightBarButtonItems([rightBarButton], animated: true)
    }
    
    func initViewModel() {
        viewModel.reloadTableView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        Task {
            await viewModel.getUsersAndUserCellViewModels()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserTableViewCell else {return UITableViewCell()}
        let viewModel = viewModel.getCellViewModel(at: indexPath)
        userCell.userCellViewModel = viewModel
        return userCell
    }
}

