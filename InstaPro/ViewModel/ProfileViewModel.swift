//
//  ProfileViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation
import SwiftUI

class ProfileViewModel:ObservableObject{
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    @Published var email = ""
    @Published var displayName = ""
    @Published var imgUser = ""
    
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
    
    func apiSignOut(){
        SessionStore().signOut()
    }
    
    func apiLoadUser(uid: String){
        DatabaseStore().loadUser(uid: uid, completion: { user in
            self.email = user?.email ?? ""
            self.displayName = user?.displayName ?? ""
            self.imgUser = user?.imgUser ?? ""
            self.isLoading = false
        })
    }
    
    func apiUploadMyImage(uid: String, image: UIImage){
        isLoading = true
        StorageStore().uploadUserImage(uid: uid, image, completion: { downloadUrl in
            self.apiUpdateMyImage(uid: uid, imgUser: downloadUrl)
            self.apiLoadUser(uid: uid)
        })
    }
    
    func apiUpdateMyImage(uid: String, imgUser: String?){
        DatabaseStore().updateMyImage(uid: uid, imgUser: imgUser)
    }
}
