//
//  MainTableViewCell.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 22/08/22.
//

import UIKit

protocol UserTableViewCellDelegate {
    func showPost(user: UserMapper)
}

class UserTableViewCell: UITableViewCell {
    
    var delegate: UserTableViewCellDelegate?
    var user = UserMapper()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var emptyStackView: UIStackView!
    @IBOutlet weak var userInfoStackView: UIStackView!
    @IBOutlet weak var ShowPostStackView: UIStackView!
    
    override func awakeFromNib() {}
    
    func configureCell(user: UserMapper) {
        ShowEmpty(isEmpty: false)
        self.user = user
        userNameLabel.text = user.name
        userPhoneLabel.text = user.phone
        userEmailLabel.text = user.email
        viewCell.addShadow()
    }
    
    func ShowEmpty(isEmpty: Bool) {
        emptyStackView.isHidden = !isEmpty
        userInfoStackView.isHidden = isEmpty
        ShowPostStackView.isHidden = isEmpty
    }
    
    @IBAction func showPost(_ sender: Any) {
        delegate?.showPost(user: user)
    }
    
}
