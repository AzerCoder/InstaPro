//
//  MyPostCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 31/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    var uid: String
    var viewModel: ProfileViewModel
    @State private var showingAlert = false
    var post: Post
    var length: CGFloat
    
    var body: some View {
        VStack{
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .frame(width: length,height: length)
                .scaledToFit()
            Text(post.caption!)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.vertical,10)
                .frame(width: length)
        }.padding(.horizontal)
    }
}

#Preview {
    MyPostCell(uid: "uid", viewModel: ProfileViewModel(), post: Post(caption: "Azamjon", imgPost: Utills.image1), length: UIScreen.width)
}
