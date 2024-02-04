//
//  MyPostCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 31/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    var post: Post
    @State var length: CGFloat
    var body: some View {
        VStack{
            WebImage(url: URL(string: post.imgUrl!))
                .resizable()
                .frame(width: length,height: length)
                .scaledToFit()
            Text("Make a symbolic breakpint at")
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.vertical,10)
                .frame(width: length)
        }.padding(.horizontal)
    }
}

#Preview {
    MyPostCell(post: Post(imgUrl: Utills.image2), length: UIScreen.width)
}
