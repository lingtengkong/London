//
//  LondonList.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

struct LondonList: View {
    // user.London = LondonData
    @EnvironmentObject private var user: User

    
    var body: some View {
        List {
            Toggle(isOn: $user.showFavoritesOnly) {
                Text("My Favorites")
            }
            
            ForEach(user.London) { London in
                if !self.user.showFavoritesOnly || London.isFavorite {
                    NavigationLink(
                        destination: LondonDetailPage(London: London)
                    ) {
                        LondonRow(London: London)
                    }
                }
            }
            .onMove(perform: moveLondon)
            .onDelete(perform: deletLondon)
        }
        .navigationBarTitle(Text("London"))
        .toolbar(content: {
            #if os(iOS)
            EditButton()
            #endif
        })
    }
    
    // Add functions to delet components in list
    func moveLondon(from: IndexSet, to: Int){
        withAnimation {
            user.London.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deletLondon(offsets: IndexSet) {
        withAnimation {
            user.London.remove(atOffsets: offsets)
        }
    }
}

struct LondonList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LondonList()
        }
        .environmentObject(User())
    }
}
