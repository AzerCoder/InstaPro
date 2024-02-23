//
//  UserView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 20/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserView: View {
    @State var isList = true 
    var uid: String
    var user : User
    @EnvironmentObject var session: SessionStore
    @ObservedObject var viewModal: SearchViewModel
        
        init(uid: String, user: User, viewModel: SearchViewModel) {
            self.uid = uid
            self.user = user
            self.viewModal = viewModel
        }

    @ObservedObject var viewModell = FeedViewModel()
  
    @State private var followersCount: Int = 0
       @State private var followingCount: Int = 0
       @State private var postCount: Int = 0

    let databaseStore = DatabaseStore()
    
    var columns:[GridItem] = Array(repeating: .init(.fixed(UIScreen.width/2)), count: 2)
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing:0){
                    
                    VStack(alignment:.leading,spacing:0){
                        HStack{
                            
                            VStack{
                                if !user.imgUser!.isEmpty{
                                    WebImage(url: URL(string: user.imgUser!))
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 70,height: 70)
                                        .padding(.all,2)
                                }else{
                                                                      
                                Image("profile").resizable().clipShape(Circle())
                                    .frame(width: 70,height: 70)
                                    .padding(.all,2)
                                                                }
                            }.overlay(RoundedRectangle(cornerRadius: 35)
                                .stroke(Utills.color2,lineWidth:2))
                            
                            Spacer()
                            
                            VStack{
                                Text(String(postCount))
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                Text("Posts")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                            }
                            
                            VStack{}.frame(width: 1,height: 25)
                                .background(.gray.opacity(0.5))
                            
                            VStack{
                                Text(String(followersCount))
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                Text("Followers")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                            }
                            
                            VStack{}.frame(width: 1,height: 25)
                                .background(.gray.opacity(0.5))
                            
                            VStack{
                                Text(String(followingCount))
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                Text("Following")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                            }.padding(.trailing,20)
                        }
                        
                        
                        
                        
                        Text(user.displayName!)
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .padding(.top,15)
                        Text(user.email!)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .padding(.top,3)
                    }
                    .frame(width: 340)
                    
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
                                .foregroundColor(Utills.color2)
                                .frame(width: 340,height: 30)
                                .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(.gray,lineWidth: 1))

                        }else{
                        Text("Follow")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(width: 340,height: 30)
                            .background(Utills.color2)
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(.gray,lineWidth: 1))
                        
                                                }
                    }).padding(.top,10)
                    
                    HStack{
                        
                        Button(action: {
                            isList = true
                        }, label: {
                            Image(systemName: "rectangle.grid.1x2")
                                .font(.title2)
                        })
                        Spacer()
                        Button(action: {
                            isList = false
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                        })
                        
                    }.frame(width: 200).padding(.vertical,10)
                    
                    if isList{
                        List{
                            ForEach(viewModell.items,id:\.self){ item in
                                if let uid = session.session?.uid! {
                                    UserInfiCell(length: UIScreen.width, uid: uid, viewModel: FeedViewModel(), post: item).listRowInsets(EdgeInsets())
                                }
                            }
                        }.listStyle(PlainListStyle()).padding(.horizontal,3)
                    }else{
                        ScrollView{
                            LazyVGrid(columns:columns,spacing: 8){
                                ForEach(viewModell.items, id:\.self){ item in
                                    if let uid = session.session?.uid!{
                                        UserInfiCell(length: UIScreen.width/2, uid: uid, viewModel: FeedViewModel(), post: item)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            
                viewModell.apiUserList(uid:uid)
                
                // Foydalanuvchining followers sonini olish
                databaseStore.getFollowersCount(forUserID: uid) { count in
                    followersCount = count
                }
                
                // Foydalanuvchining followinglar sonini olish
                databaseStore.getFollowingCount(forUserID: uid) { count in
                    followingCount = count
                }
                
                // Foydalanuvchining postlar sonini olish
                databaseStore.getPostCount(forUserID: uid) { count in
                    postCount = count
                }
               
            
        }
    }
}
#Preview {
    UserView(uid: "", user: User(), viewModel: SearchViewModel())
}
