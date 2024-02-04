//
//  LikeViewModel.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import Foundation

class LikeViewModel:ObservableObject{
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiPostList(complition: @escaping ()->()){
        isLoading = true
        items.removeAll()
        
       
        isLoading = false
        complition()
        
    }
    
}
