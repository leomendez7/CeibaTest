//
//  MainDatasource.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 22/08/22.
//

import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell",
                                                                        for: indexPath) as? MainTableViewCell else { return MainTableViewCell() }
        
        return cell
    }
    
    
    
    
}
