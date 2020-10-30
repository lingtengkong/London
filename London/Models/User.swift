//
//  User.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import Combine
import SwiftUI

// User data, includes london data and profile data
final class User: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var London = LondonData
    @Published var profile = Profile.default
}
