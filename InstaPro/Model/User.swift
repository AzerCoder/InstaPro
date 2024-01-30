//
//  User.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation

struct User: Hashable{
    var uid: String?
    var email: String?
    var displayName: String?
    
    init(uid: String? = nil, email: String? = nil, displayName: String? = nil) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
