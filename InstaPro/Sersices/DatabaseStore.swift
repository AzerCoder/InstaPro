//
//  DatabaseStore.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 04/02/24.
//

import Foundation
import FirebaseFirestore

class DatabaseStore:ObservableObject{
    var USER_PATH = "users"
    
    let store = Firestore.firestore()
    
    func storeUser(user: User){
        
        let params = ["uid": user.uid, "email": user.email,"displayName": user.displayName,"password": user.pasword]
        store.collection(USER_PATH).document(user.uid!).setData(params as [String : Any])
    }
    
    func loadUser(uid: String, completion: @escaping (User?) -> ()) {
        print(uid)
        store.collection(USER_PATH).document(uid).getDocument(completion: {(document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                // Do something with doc data
                
                let uid = docData!["uid"] as? String ?? ""
                let email = docData!["email"] as? String ?? ""
                let displayName = docData!["displayName"] as? String ?? ""
                let imgUser = docData!["imgUser"] as? String ?? ""
                var user = User(email: email, displayName: displayName, imgUser: imgUser)
                user.uid = uid
                completion(user)
            } else {
                print("Document does not exist")
                completion(nil)
            }
        })
    }
    
    func loadUsers(keyword: String,completion: @escaping ([User]?) -> ()) {
        var items: [User] = []
        
        store.collection(USER_PATH)
            .whereField("displayName", isGreaterThanOrEqualTo: keyword)
            .whereField("displayName", isLessThan: keyword + "z")
            .addSnapshotListener{ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No users")
                    return
                }
                documents.compactMap{ document in
                    let uid = document["uid"] as? String ?? ""
                    let email = document["email"] as? String ?? ""
                    let displayName = document["displayName"] as? String ?? ""
                    let imgUser = document["imgUser"] as? String ?? ""
                    let user = User(uid: uid, email: email, displayName: displayName, imgUser: imgUser)
                    items.append(user)
                }
                completion(items)
            }
    }
    
    
    func updateMyImage(uid: String, imgUser: String?) {
        store.collection(USER_PATH).document(uid).updateData(["imgUser": imgUser!])
    }
}
