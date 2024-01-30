//
//  UploadView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct UploadView: View {
    @Binding var tabSelection: Int
    
    @State private var sourType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage : UIImage?
    @State private var imagePickerDiplay = false
    @State var caption = ""
    @State var actionSheet = false
    
    func uploadPost(){
        if caption.isEmpty || selectedImage == nil {
            return
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        if selectedImage != nil{
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(maxWidth: UIScreen.width,maxHeight:UIScreen.width)
                                .scaledToFit()
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        selectedImage = nil
                                    }, label: {
                                        Image(systemName: "trash")
                                            .resizable().scaledToFit()
                                            .frame(width: 25,height: 25)
                                    }).padding()
                                }
                                Spacer()
                            }
                        }else{
                            Button(action: {
                                //self.sourType = .photoLibrary
                                //self.imagePickerDiplay.toggle()
                                self.actionSheet.toggle()
                            }, label: {
                                Image(systemName: "camera.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                            })
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
                                    },.cancel()]
                                )
                               
                            }
                        }
                    }
                    .frame(maxWidth: UIScreen.width,maxHeight:UIScreen.width)
                    .background(.gray.opacity(0.2))
                    VStack{
                        TextField("Caption", text: $caption)
                            .font(.system(size: 17,design: .default))
                            .frame(height: 40)
                        Divider()
                    }.padding(.top,10).padding(.horizontal,20)
                    Spacer()
                }
                
                
               
            }
            .navigationBarItems(trailing:
            Button(action: {
                self.tabSelection = 0
                self.uploadPost()
            }, label: {
                Image(systemName: "square.and.arrow.up")
            })
            )
            .navigationBarTitle("Upload",displayMode: .inline)
        }
    }

}

#Preview {
    UploadView(tabSelection: .constant(0))
}
