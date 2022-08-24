//
//  PostController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire
import ObjectMapper
import CoreData

extension PostViewController {
    
    func fetchPost() {
        playAnimateView()
        postStore.fetchPost(userId: "\(user.id)") { posts in
            if let posts = posts {
                self.posts = posts
                self.deletePost()
                self.savePostCoreData(posts: posts.toJSON())
            }
            self.stopAnimate()
        }
    }
    
    func fetchPostCoreData() {
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        let userId = Default.userId()
        if userId == user.id {
            do {
                postCoreData = try context?.fetch(fetchRequest) as? [Post] ?? []
                let postsDic: NSArray = ManagedParser.convertToArray(managedObjects: postCoreData as NSArray)
                let posts = Mapper<UserPost>().mapArray(JSONArray: postsDic as? [[String : Any]] ?? [[:]])
                self.posts = posts
            } catch let error as NSError {
                print("Error fetch core data: \(error.localizedDescription)")
            }
        } else {
            fetchPost()
        }
    }
    
    func savePostCoreData(posts: [[String: Any]]) {
        posts.forEach { post in
            guard let context = context else { return }
            let newPost = Post(context: context)
            newPost.id = Int64(post["id"] as? Int ?? 0)
            newPost.userId = Int64(post["userId"] as? Int ?? 0)
            newPost.title = post["title"] as? String
            newPost.body = post["body"] as? String
            Default.save(userId: user.id)
            do {
                try context.save()
            } catch let error as NSError{
                print("Error save: \(error.localizedDescription)")
            }
        }
    }
    
    func deletePost() {
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        do {
            let post = try context?.fetch(fetchRequest) as? [Post] ?? []
            post.forEach { post in
                context?.delete(post)
            }
            try context?.save()
        } catch let error as NSError {
            print("Error fetch core data: \(error.localizedDescription)")
        }
    }
    
}
