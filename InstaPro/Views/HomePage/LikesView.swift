//
//  LikesView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var viewModel = LikeViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id:\.self){item in
                        if let uid = session.session?.uid! {
                            LikePostCell(uid: uid, viewModel: LikeViewModel(), post: item).listRowInsets(EdgeInsets())
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationBarTitle("Likes",displayMode: .inline)
        }
        .onAppear{
            if let uid = session.session?.uid{
                self.viewModel.apiLikesList(uid:uid)
            }
        }
        
    }
}
#Preview {
    LikesView()
}
