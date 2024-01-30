//
//  HomeView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import SwiftUI

struct HomeView: View {
    @State private var tabSelection = 0
    var body: some View {
        TabView(selection: $tabSelection){
            FeedView(tabSelection: $tabSelection)
                .font(.system(size: 20,weight: .bold,design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            SearchView()
                .font(.system(size: 20,weight: .bold,design: .rounded))
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            UploadView(tabSelection: $tabSelection)
                .font(.system(size: 20,weight: .bold,design: .rounded))
                .tabItem {
                    Image(systemName: "camera")
                }.tag(2)
            LikesView()
                .font(.system(size: 20,weight: .bold,design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            ProfileView()
                .font(.system(size: 20,weight: .bold,design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(Utills.color2)
        .onAppear{
            UITabBar.appearance().barTintColor = .white
        }
    }
}

#Preview {
    HomeView()
}
