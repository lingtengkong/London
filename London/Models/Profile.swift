//
//  Profile.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import Foundation

// User profile information
struct Profile {
    var username: String
    var moodPhoto: Mood
    var birth: Date
    var profilePhoto: ProfilePhoto
    
    static let `default` = Self(username: "Ling", moodPhoto: .laugh, profilePhoto: .ling)
    
    init(username: String, moodPhoto: Mood = .laugh, profilePhoto: ProfilePhoto = .ling) {
        self.username = username
        self.moodPhoto = moodPhoto
        self.birth = Date()
        self.profilePhoto = profilePhoto
    }
    
    enum Mood: String, CaseIterable {
        case laugh = "😁"
        case smile = "😊"
        case calm = "😳"
        case sad = "😩"
        case cry = "😭"
    }
    
    enum ProfilePhoto: String, CaseIterable {
        case ling = "ling"
        case flower = "flower"
        case piao = "piao"
        case fat = "fat"
        case nu = "nu"
        case sh = "sh"
        case ch = "ch"
        case pi = "pi"
    }
}
