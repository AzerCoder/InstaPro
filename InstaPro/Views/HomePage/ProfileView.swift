//
//  ProfileView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing:0){
                    VStack{
                        Image("profile").resizable().clipShape(Circle())
                            .frame(width: 70,height: 70)
                            .padding(.all,2)
                    }.overlay(RoundedRectangle(cornerRadius: 35)
                        .stroke(Utills.color2,lineWidth:2))
                    
                    HStack{
                        Spacer()
                        VStack{
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                            })
                            Spacer()
                        }
                    }.frame(width: 77,height: 77)
                }
            }
            .navigationBarItems(trailing:
            Button(action: {
                
            }, label: {
                Image(systemName: "pip.exit")
            }))
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
