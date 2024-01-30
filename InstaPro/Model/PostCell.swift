//
//  PostCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    var post:Post
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
                    Text(post.title!)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Text(post.content!)
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
            
            WebImage(url: URL(string: post.imgUrl!))
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
    PostCell(post: Post(title: "Azamjon001",content: "March 12, 2024",imgUrl: Utills.image1))
}
