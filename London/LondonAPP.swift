//
//  LondonAPP.swift
//  London
//
//  Created by Handsome Ling on 30/10/2020.
//

import SwiftUI

// This the main file of the APP
@main
struct LondonApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                // set environment to User
                .environmentObject(User())
        }
    }
}
