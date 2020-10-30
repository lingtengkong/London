//
//  ProfileEditor.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.birth)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.birth)!
        return min...max
    }
    
    var body: some View {
        List {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Choose your favorite profile photo").bold()
                
                Picker("ProfilePhoto", selection: $profile.profilePhoto) {
                    ForEach(Profile.ProfilePhoto.allCases, id: \.self) { ProfilePhoto in
                        Avatar(image: Image(ProfilePhoto.rawValue),scale: 120)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
            }
            .padding(.top)
            
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }

            HStack {
                Text("Birthday").bold()
                Divider()
                DatePicker(
                    "",
                    selection: $profile.birth,
                    in: dateRange,
                    displayedComponents: .date)
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Mood").bold()
                
                Picker("Mood", selection: $profile.moodPhoto) {
                    ForEach(Profile.Mood.allCases, id: \.self) { Mood in
                        Text(Mood.rawValue).tag(Mood)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
