//
//  LikesView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct LikesView: View {
    @ObservedObject var viewModel = LikeViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id:\.self){item in
                        PostCell(post:item).listRowInsets(EdgeInsets())
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationBarTitle("Likes",displayMode: .inline)
        }
        .onAppear{
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
        
    }
}
#Preview {
    LikesView()
}
