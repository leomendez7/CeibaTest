//
//  PostCell.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//


import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {}
    
    func configureCell(user: UserPost) {
        titleLabel.text = user.title
        bodyLabel.text = user.body
        viewCell.addShadow()
    }
    
}
