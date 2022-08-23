//
//  PostController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire

extension PostViewController {
    
    func fetchPost() {
        playAnimateView()
        postStore.fetchPost(userId: "\(user.id)") { posts in
            if let posts = posts {
                self.posts = posts
            }
            self.stopAnimate()
        }
    }
    
}
