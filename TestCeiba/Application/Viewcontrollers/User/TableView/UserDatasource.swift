//
//  MainDatasource.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 22/08/22.
//

import UIKit

extension UserViewController: UITableViewDataSource, UITableViewDelegate, UserTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultSearchController.isActive {
            return filteredTableData.count
        } else {
           return tableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell",
                                                                        for: indexPath) as? UserTableViewCell else { return UserTableViewCell() }
        cell.delegate = self
        if resultSearchController.isActive {
            cell.configureCell(user: filteredTableData[indexPath.row])
        } else {
            cell.configureCell(user: tableData[indexPath.row])
        }
        return cell
    }
    
    func showPost(user: Publisher) {
        selectUser = user
        performSegue(withIdentifier: Segue.showPost.rawValue, sender: nil)
    }
    
}
