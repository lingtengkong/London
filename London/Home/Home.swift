//
//  Home.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

// Home category
struct Home: View {
    var categories: [String: [London]] {
        Dictionary(
            grouping: LondonData,
            by: { $0.category.rawValue }
        )
    }

    @State var showingProfile = false
    @EnvironmentObject var user: User
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Avatar(image: Image(user.profile.profilePhoto.rawValue),scale: 40)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    // Music player
                    HStack {
                        Text("Da Da Da - Cyndi Wang")
                        
                        Spacer()
                        
                        Button(action: { MusicPlayer.shared.startBackgroundMusic(FileName: "DADADA")}){
                            Image(systemName: "play.circle")
                                .imageScale(.large)
                        }
                        
                        Button(action: { MusicPlayer.shared.stopBackgroundMusic()}){
                            Image(systemName: "stop.circle")
                                .imageScale(.large)
                        }
                    }.padding()
                    
                    List {                        
                        ForEach(categories.keys.sorted(), id: \.self) { key in
                            CategoryRow(categoryName: key, items: self.categories[key]!)
                        }
                        .listRowInsets(EdgeInsets())
                        
                        NavigationLink(destination: LondonList()) {
                            Text("My list")
                                .font(.title)
                        }
                    }
                }
                .navigationBarTitle(Text("London"))
                .navigationBarItems(trailing: profileButton)
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(self.user)
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(User())
    }
}
