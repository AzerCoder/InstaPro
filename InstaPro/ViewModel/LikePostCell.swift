//
//  LikePostCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 04/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct LikePostCell: View {
    @State private var showingAlert = false
    var uid: String
    var viewModel: LikeViewModel
    @State var post: Post
    var body: some View {
        VStack(spacing:0){
            HStack(spacing:0){
                VStack{
                    Image("profile").resizable().clipShape(Circle())
                        .frame(width: 46,height: 46)
                        .padding(.all,2)
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
                Text("Make a symbolic breakpoint at uView , category on UiView listed in")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
            }.padding(.all,15)
        }
    }
}

#Preview {
    LikePostCell( uid: "uid", viewModel: LikeViewModel(), post: Post(caption: "symbolic", imgPost: Utills.image1))
}
