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
    
    func apiFeedList(uid: String){
        isLoading = true
        items.removeAll()
        
        DatabaseStore().loadFeeds(uid: uid, completion: { posts in
            self.items = posts!
            self.isLoading = false
           
        })
      
        
    }
    
}
