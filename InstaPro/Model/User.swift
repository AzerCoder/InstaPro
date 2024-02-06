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
    var pasword: String?
    var displayName: String?
    var imgUser:String?
    
    var isFollowed:Bool = false
    
    init(uid: String? = nil, email: String? = nil, displayName: String? = nil) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

    init(uid: String? = nil, email: String? = nil, pasword: String? = nil, displayName: String? = nil, imgUser: String? = nil) {
        self.uid = uid
        self.email = email
        self.pasword = pasword
        self.displayName = displayName
        self.imgUser = imgUser
    }
   
}
