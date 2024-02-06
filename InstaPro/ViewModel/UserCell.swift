//
//  UserCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserCell: View {
    var uid: String
    var user : User
    var viewModal: SearchViewModel
    
    var body: some View {
        HStack(spacing:0){
            VStack{ 
                if !user.imgUser!.isEmpty{
                    WebImage(url: URL(string: user.imgUser!))
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
                Text(user.displayName!)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                Text(user.email!)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }.padding(.leading,15)
            Spacer()
            
            Button(action: {
                if user.isFollowed{
                    viewModal.apiUnFollowUser(uid: uid, to: user)
                }else{
                    viewModal.apiFollowUser(uid: uid, to: user)
                }
            }, label: {
                if user.isFollowed{
                    Text("Following")
                        .font(.system(size: 15))
                        .foregroundColor(.black.opacity(0.5))
                        .frame(width: 90,height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(.gray,lineWidth: 1))
                    
                }else{
                    Text("Follow")
                        .font(.system(size: 15))
                        .foregroundColor(.black.opacity(0.5))
                        .frame(width: 90,height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(.gray,lineWidth: 1))
                    
                }
            })
        }.padding()
    }
}

#Preview {
    UserCell(uid: "", user: User(), viewModal: SearchViewModel())
}
