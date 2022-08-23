//
//  MainController.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire

extension MainViewController {
    
    func fetchUsers() {
        playAnimateView()
        userStore.fetchUsers { response in
            if let users = response {
                self.users = users
            }
            self.stopAnimate()
        }
    }
    
}
