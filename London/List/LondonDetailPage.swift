//
//  LondonDetailPage.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

// Page for details
struct LondonDetailPage: View {
    @State private var zoomed = false
    @EnvironmentObject var user: User
    var London: London
    
    // user index for favorite images
    var LondonIndex: Int {
        user.London.firstIndex(where: { $0.id == London.id })!
    }

    // Annoying stack of the components
    var body: some View {
        VStack(spacing: 0) {
            if London.name == "London Eye" && zoomed{
                Spacer()
                PassWord()
            } else{
                London.image
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill: .fit)
                    .onTapGesture{
                        withAnimation{
                            zoomed.toggle()
                        }
                    }
                    .ignoresSafeArea(.all)
            }

            
            if !zoomed{
                VStack(spacing: 0){
                    VStack{
                        HStack {
                            Text(London.name)
                                .bold()
                                .font(.title)
                            
                            Button(action: {
                                self.user.London[self.LondonIndex]
                                    .isFavorite.toggle()
                            }) {
                                if self.user.London[self.LondonIndex].isFavorite {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(Color.red)
                                } else {
                                    Image(systemName: "heart")
                                        .foregroundColor(Color.black)
                                }
                            }
                        }
                        HStack(alignment: .top) {
                            Spacer()
                            Text(London.descriptiion)
                                .font(Font.headline.smallCaps())
                            Spacer()
                        }
                       
                    }
                    .padding()
                    .background(Color.yellow)
                    
                    MapView(coordinate: London.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 200)
                    
                    ScrollView{
                        Text(London.story)
                            .padding(.all)
                    }
                      
                }
                .transition(.move(edge: .bottom))
            }
            
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LondonDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        let user = User()
        return LondonDetailPage(London: user.London[8])
            .previewDevice("iPhone 12")
            .environmentObject(user)
    }
}
