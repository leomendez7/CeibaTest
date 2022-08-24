//
//  MainController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire
import CoreData
import ObjectMapper

extension UserViewController {
    
    func fetchUsers() {
        playAnimateView()
        userStore.fetchUsers { response in
            if let users = response {
                self.users = users
                self.saveUserCoreData(users: users.toJSON())
            }
            self.stopAnimate()
        }
    }
    
    func fetchUserCoreData() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            userCoreData = try context?.fetch(fetchRequest) as? [User] ?? []
            let userDic: NSArray = ManagedParser.convertToArray(managedObjects: userCoreData as NSArray)
            let users = Mapper<UserMapper>().mapArray(JSONArray: userDic as? [[String : Any]] ?? [[:]])
            if users.count == 0 {
                fetchUsers()
            } else {
                self.users = users
            }
        } catch let error as NSError {
            print("Error fetch core data: \(error.localizedDescription)")
        }
    }
    
    func saveUserCoreData(users: [[String: Any]]) {
        users.forEach { user in
            guard let context = context else { return }
            let newUser = User(context: context)
            newUser.id = Int64(user["id"] as? Int ?? 0)
            newUser.name = user["name"] as? String
            newUser.phone = user["phone"] as? String
            newUser.email = user["email"] as? String
            do {
                try context.save()
            } catch let error as NSError{
                print("Error save: \(error.localizedDescription)")
            }
        }
    }
    
}
