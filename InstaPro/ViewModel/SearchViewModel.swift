//
//  SearchViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation

class SearchViewModel:ObservableObject{
    @Published var isLoading = false
    @Published var items: [User] = []
    
    func apiUserList(complition: @escaping ()->()){
        isLoading = true
        items.removeAll()
        
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        self.items.append(User(uid: "1",email: "abdumuxtorov@gmail.com", displayName: "Azamjon001"))
        
        isLoading = false
        complition()
    }
}
