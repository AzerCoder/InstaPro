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
                    
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                })
            }.padding(.horizontal,15).padding(.top,15)
            
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .scaledToFit().padding(.top,15)
            
            HStack(spacing:0){
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .font(.title)
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.title)
                }).padding(.leading,10)
                Spacer()
            }.padding(.horizontal,15).padding(.top,15)
            
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