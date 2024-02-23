//
//  UserInfiCell.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 20/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserInfiCell: View {
    var length: CGFloat
    var uid: String
    var viewModel: FeedViewModel
    @State var post: Post
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
    UserInfiCell(length: UIScreen.width, uid: "", viewModel: FeedViewModel(), post: Post(caption: "", imgPost: ""))
}
