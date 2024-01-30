//
//  FeedView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 30/01/24.
//

import SwiftUI

struct FeedView: View {
    @Binding var tabSelection: Int
    var body: some View {
        NavigationView{
            ZStack{
                
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
        //.accentColor(Utills.color2)
    }
}

#Preview {
    FeedView(tabSelection: .constant(0))
}
