//
//  MainTableViewCell.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 22/08/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userCelLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {}
    
    func configureCell(user: Publisher) {
        userNameLabel.text = user.name
        userCelLabel.text = user.phone
        userCelLabel.text = user.email
        viewCell.layer.shadowColor = ColorScheme.shadow.cgColor
        viewCell.layer.shadowOpacity = 1
        viewCell.layer.shadowOffset = .zero
        viewCell.layer.shadowRadius = 10
    }
    
}
