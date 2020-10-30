//
//  PassWord.swift
//  London
//
//  Created by Handsome Ling on 30/10/2020.
//

import SwiftUI

struct PassWord: View {
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("What is the answer?")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            SecureField("Enter your answer", text: $password)
                .padding()
            
            Text("a. What is the answer?")
            Text("b. What is the answer?")
            Text("c. What is the answer?")
            Text("d. What is the answer?")
            
                
            if password == "dadada"{
                VStack {
                    Image("cheers")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    Text("Cheers!")
                        .bold()
                }
            }
        }
    }
}
struct PassWord_Previews: PreviewProvider {
    static var previews: some View {
        PassWord()
    }
}
