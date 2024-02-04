//
//  SearchView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @EnvironmentObject var session : SessionStore
    @State var keyword = ""
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    TextField("Search for user", text: $keyword)
                        .padding(.horizontal,15)
                        .frame(height: 45)
                        .font(.system(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(.black.opacity(0.5),lineWidth: 1))
                        .padding(.horizontal,20)
                        
                    List{
                        ForEach(viewModel.items,id: \.self ){ item in
                            UserCell(user:item)
                                .listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }.listStyle(PlainListStyle())
                }
                
                if viewModel.isLoading{
                    ProfileView()
                }
                
            } .navigationBarTitle("Search",displayMode: .inline)
            .onAppear{
                if let uid = session.session?.uid {
                    viewModel.apiUserList(uid: uid, keyword: keyword)
                } 
            }
        }
    }
}

#Preview {
    SearchView()
}
