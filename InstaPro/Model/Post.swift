//
//  Post.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation

struct Post: Hashable{
    var title:String?
    var content:String?
    var imgUrl:String?
    
    init(title: String? = nil, content: String? = nil) {
        self.title = title
        self.content = content
    }
    
    init(title: String? = nil, content: String? = nil, imgUrl: String? = nil) {
        self.title = title
        self.content = content
        self.imgUrl = imgUrl
    }
}
