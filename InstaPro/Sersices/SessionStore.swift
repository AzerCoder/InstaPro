//
//  SessionStore.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//
import Combine
import Foundation
import Firebase

class SessionStore: ObservableObject{
    var dischange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet{self.dischange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen(){
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
            } else {
                self.session = nil
            }
        }
    }
    
    //     additional methods (sign up, sign in) will go here
        
        func signUp(email: String, password: String, handler: @escaping(AuthDataResult?, Error?) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        }

        func signIn(email: String, password: String, handler: @escaping(AuthDataResult?, Error?) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        }
        
        func signOut () -> Bool {
            do {
                try Auth.auth().signOut()
                self.session = nil
                return true
            } catch {
                return false
            }
        }
}
