//
//  PostViewController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit

class PostViewController: BaseViewController {
    
    var user = UserMapper()
    let postStore = PostStore()
    var postCoreData = [Post]()
    var tableData = [UserPost]()
    var posts = [UserPost]() {
        didSet {
            tableData = posts
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUser()
        fetchPostCoreData()
    }
    
    func configureUser() {
        userNameLabel.text = user.name
        userPhoneLabel.text = user.phone
        userEmailLabel.text = user.email
    }
    
}
