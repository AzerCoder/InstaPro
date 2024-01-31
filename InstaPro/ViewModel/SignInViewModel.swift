//
//  SignInViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 31/01/24.
//

import Foundation

class SignInViewModel: ObservableObject{
    @Published var isLoading = false
    
    func apiSignIn(email:String,pasword:String,complition: @escaping (Bool)->()){
        isLoading = true
        SessionStore().signIn(email: email, password: pasword, handler: {(res,err) in
            self.isLoading = false
            if err != nil{
                print("Check email or pasword")
                complition(false)
            }
            print("User signed in")
            complition(true)
        })
    }
}
