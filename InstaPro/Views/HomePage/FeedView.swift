//
//  FeedView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct FeedView: View {
    @Binding var tabSelection: Int
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id:\.self){item in
                        PostCell(post:item).listRowInsets(EdgeInsets())
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationBarItems(trailing:
            Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera")
            })
            )
            .navigationBarTitle("Instagram",displayMode: .inline)
        }
        .onAppear{
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
        
    }
}

#Preview {
    FeedView(tabSelection: .constant(0))
}
