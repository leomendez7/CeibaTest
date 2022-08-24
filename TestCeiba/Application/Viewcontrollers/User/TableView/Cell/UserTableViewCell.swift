//
//  MainTableViewCell.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 22/08/22.
//

import UIKit

protocol UserTableViewCellDelegate {
    func showPost(user: Publisher)
}

class UserTableViewCell: UITableViewCell {
    
    var delegate: UserTableViewCellDelegate?
    var user = Publisher()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {}
    
    func configureCell(user: Publisher) {
        self.user = user
        userNameLabel.text = user.name
        userPhoneLabel.text = user.phone
        userEmailLabel.text = user.email
        viewCell.addShadow()
    }
    
    @IBAction func showPost(_ sender: Any) {
        delegate?.showPost(user: user)
    }
    
}
