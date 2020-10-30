//
//  CategoryRow.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [London]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { London in
                        NavigationLink(
                            destination: LondonDetailPage(
                                London: London
                            )
                        ) {
                            CategoryItem(London: London)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var London: London
    var body: some View {
        VStack(alignment: .leading) {
            

            
            London.image
                .renderingMode(.original)   // color mode
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(London.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: LondonData[0].category.rawValue,
            items: Array(LondonData.prefix(4))
        )
        .environmentObject(User())
    }
}

