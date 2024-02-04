//
//  FeedView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct FeedView: View {
    @Binding var tabSelection: Int
    @EnvironmentObject var session: SessionStore
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id:\.self){item in
                        if let uid = session.session?.uid!{
                            FeedPostCell(uid: uid, viewModel: viewModel, post: item).listRowInsets(EdgeInsets())
                        }
                    }
                }.listStyle(PlainListStyle())
                
//                if viewModel.isLoading{
//                    ProfileView()
//                }
            }
            .navigationBarItems(trailing:
            Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera")
            })
            )
            .navigationBarTitle("Instagram",displayMode: .inline)
        }
        .onAppear{
            if let uid = session.session?.uid {
                viewModel.apiFeedList(uid:uid)
               }
        }
        
    }
}

#Preview {
    FeedView(tabSelection: .constant(0))
}
