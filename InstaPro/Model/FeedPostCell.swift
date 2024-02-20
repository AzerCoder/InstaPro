//
//  PostCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct FeedPostCell: View {
    @State private var showingAlert = false
    var uid: String
    var viewModel: FeedViewModel
    @State var post: Post
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                VStack{
                    if !post.imgUser!.isEmpty{
                        WebImage(url: URL(string: post.imgUser!))
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 46,height: 46)
                            .padding(.all,2)
                    }else{
                        Image("profile")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 46,height: 46)
                            .padding(.all,2)
                    }
                }.overlay(RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Utills.color2,lineWidth:2))
                VStack(alignment:.leading,spacing:3){
                    Text(post.displayName!)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Text(post.time!)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }.padding(.leading,15)
                Spacer()
                
                Button(action: {
                    self.showingAlert = true 
                }, label: {
                    if uid == post.uid{
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .alert(isPresented: $showingAlert) {
                    let title = "Delete"
                    let message = "Do you want to delete this post?"
                    return Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("Confirm"), action: {
                        // Some action
                        viewModel.apiRemovePost(uid: uid, post: post)
                    }), secondaryButton: .cancel())
                }
            }.padding(.horizontal,15).padding(.top,15)
            
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .scaledToFit().padding(.top,15)
            
            VStack(alignment:.leading) {
                HStack(spacing:0){
                    
                    Button(action: {
                        if post.isLiked!{
                            post.isLiked = false
                        }else{
                            post.isLiked = true
                        }
                        viewModel.apiLikePost(uid:uid,post:post)
                    }, label: {
                        if post.isLiked!{
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .font(.title)
                        }else{
                            Image(systemName: "heart")
                                .font(.title)
                        }
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right")
                            .font(.title)
                    }).padding(.leading,10)
                    Spacer()
                    
                }.padding(.horizontal,15).padding(.top,15)
            }
            
            HStack(spacing:0){
                Text(post.caption!)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
            }.padding(.all,15)
        }
    }
}

#Preview {
    FeedPostCell( uid: "uid", viewModel: FeedViewModel(), post: Post(caption: "symbolic", imgPost: Utills.image1))
}
