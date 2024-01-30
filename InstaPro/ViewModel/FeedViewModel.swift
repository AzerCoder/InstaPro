//
//  FeedViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation

class FeedViewModel:ObservableObject{
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiPostList(complition: @escaping ()->()){
        isLoading = true
        items.removeAll()
        
        self.items.append(Post(title: "Azamjon001",content: "March 12, 2004",imgUrl: Utills.image1))
        self.items.append(Post(title: "Azamjon",content: "March 12, 2004",imgUrl: Utills.image2))
        self.items.append(Post(title: "Azamjon001",content: "March 12, 2004",imgUrl: Utills.image1))
        self.items.append(Post(title: "Azamjon",content: "March 12, 2004",imgUrl: Utills.image2))
        self.items.append(Post(title: "Azamjon001",content: "March 12, 2004",imgUrl: Utills.image1))
        self.items.append(Post(title: "Azamjon",content: "March 12, 2004",imgUrl: Utills.image2))
        self.items.append(Post(title: "Azamjon001",content: "March 12, 2004",imgUrl: Utills.image1))
        
        isLoading = false
        complition()
        
    }
    
}
