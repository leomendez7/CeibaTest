//
//  PostViewController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit

class PostViewController: BaseViewController {
    
    var user = Publisher()
    let postStore = PostStore()
    var tableData = [UserPost]()
    var posts = [UserPost]() {
        didSet {
            tableData = posts
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPost()
    }
    
}
