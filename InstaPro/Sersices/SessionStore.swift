//
//  SessionStore.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//
import Combine
import Foundation

class SessionStore: ObservableObject{
    var dischange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet{self.dischange.send(self)}}
    
    func listen(){
        self.session = User(uid: "asd",email: "asd", displayName: "asd")
        //self.session = nil
    }
}
