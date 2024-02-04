//
//  SignUpViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 31/01/24.
//

import Foundation
import Firebase

class SignUpViewModel:ObservableObject{
    
    @Published var isLoading = false
    
    func apiSignUp(email:String,pasword:String,complition: @escaping (Bool)->()){
        isLoading = true
        SessionStore().signUp(email:email,password: pasword,handler: {(res,err) in
            self.isLoading = false
            if err != nil{
                print("User not created")
                complition(false)
            }
            print("User created")
            complition(true)
        })
    }
    
    func apiStoreUser(user:User){
        DatabaseStore().storeUser(user: user)
    }
}
