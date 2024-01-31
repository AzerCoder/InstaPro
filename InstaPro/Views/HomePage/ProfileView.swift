//
//  ProfileView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct ProfileView: View {
    @State var isList = true
    @State var actionSheet = false
    @ObservedObject var viewModel = ProfileViewModel()
    @State private var sourType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage : UIImage?
    @State private var imagePickerDiplay = false
    @State var shovingAlert = false
    
    var columns:[GridItem] = Array(repeating: .init(.fixed(UIScreen.width/2)), count: 2)
    var body: some View {
       
        NavigationView{
            ZStack{
                VStack(spacing:0){
                    ZStack(alignment:.bottomTrailing) {
                        VStack{
                            if selectedImage != nil{
                               Image(uiImage: selectedImage!).resizable().clipShape(Circle())
                                    .frame(width: 70,height: 70)
                                    .padding(.all,2)
                            }else{
                                Image("profile").resizable().clipShape(Circle())
                                    .frame(width: 70,height: 70)
                                    .padding(.all,2)
                            }
                        }.overlay(RoundedRectangle(cornerRadius: 35)
                        .stroke(Utills.color2,lineWidth:2))
                        
                        Button(action: {
                            self.actionSheet.toggle()
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .background(.white)
                                .frame(width: 22,height: 22)
                        }).overlay(RoundedRectangle(cornerRadius: 35)
                            .stroke(.white,lineWidth:3))
                        
                        .sheet(isPresented: $imagePickerDiplay) {
                            ImagePickerView(selectedImage: $selectedImage, sourceType: self.sourType)
                        }
                        .actionSheet(isPresented: $actionSheet){
                            ActionSheet(
                                title: Text("Actions"),
                                buttons: [.default(Text("Camera")){
                                    self.sourType = .camera
                                    self.imagePickerDiplay.toggle()
                                },.default(Text("Photo Library")){
                                    self.sourType = .photoLibrary
                                    self.imagePickerDiplay.toggle()
                                },.destructive(Text("Trash")){
                                    self.selectedImage = nil
                                },.cancel()]
                            )
                           
                        }
                    }
                    Text("Azamjon Abdumuxtorov")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .padding(.top,15)
                    Text("abdumuxtorov@gmailcom")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(.top,3)
                    HStack{
                        VStack{
                            Text("216")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Posts")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(width: UIScreen.width/3,height: 60)
                        
                        VStack{}.frame(width: 1,height: 25)
                            .background(.gray.opacity(0.5))
                        
                        VStack{
                            Text("4,235")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(width: UIScreen.width/3,height: 60)
                        
                        VStack{}.frame(width: 1,height: 25)
                            .background(.gray.opacity(0.5))
                        
                        VStack{
                            Text("457")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Following")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(width: UIScreen.width/3,height: 60)
                    }
                    
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
                            ForEach(viewModel.items,id:\.self){ item in
                                MyPostCell(post:item, length: UIScreen.width).listRowInsets(EdgeInsets())
                            }
                        }.listStyle(PlainListStyle()).padding(.horizontal,3)
                    }else{
                        ScrollView{
                            LazyVGrid(columns:columns,spacing: 8){
                                ForEach(viewModel.items, id:\.self){ item in
                                    MyPostCell(post: item, length: UIScreen.width/2)
                                }
                                
                            }
                        }
                    }
                        
                  
                }
            }
            
            .navigationBarItems(trailing:
            Button(action: {
                self.shovingAlert = true
            }, label: {
                Image(systemName: "pip.exit")
            }))
            .alert(isPresented: $shovingAlert){
                let title = "Log Out"
                let message = "Do you want in Logout"
                return Alert(title: Text(title),
                             message: Text(message),
                             primaryButton:
                        .destructive(Text("Confirm")){
                            viewModel.apiSignOut()
                        }, secondaryButton: .cancel())
            }
            .navigationBarTitle("Profile",displayMode: .inline)
        }.onAppear{
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
    }
}

#Preview {
    ProfileView()
}
