//
//  LondonRow.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

struct LondonRow: View {
    var London: London

    var body: some View {
        HStack {
            London.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            Text(London.name)
            Spacer()

            if London.isFavorite {
                Image(systemName: "heart.fill")
                    .imageScale(.medium)
                    .foregroundColor(.red)
            }
        }
    }
}

struct LondonRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LondonRow(London: LondonData[0])
            LondonRow(London: LondonData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
