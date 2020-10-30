//
//  ProfileSummary.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

// User information
struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack {
            Avatar(image: Image(profile.profilePhoto.rawValue), scale: 200)
            
            List {
                Text(profile.username)
                    .bold()
                    .font(.title)
            
                Text("Birthday: \(self.profile.birth, formatter: Self.goalFormat)")
                    .bold()
                
                Text("Mood: \(self.profile.moodPhoto.rawValue)")
                    .bold()
            }
            Spacer()
            Text("Drag down to return")
            Spacer()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
