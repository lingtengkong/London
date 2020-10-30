//
//  Avatar.swift
//  London
//
//  Created by Handsome Ling on 30/10/2020.
//

import SwiftUI

struct Avatar: View {
    var image: Image
    // scale for changing size of avatar
    var scale: CGFloat

    var body: some View {
        image
            .resizable()
            .frame(width: scale, height: scale)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(image: Image("ling"),scale: 50)
    }
}
