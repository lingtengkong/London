//
//  LondonData.swift
//  London
//
//  Created by Handsome Ling on 28/10/2020.
//

import SwiftUI
import CoreLocation

// Define struture of London data
struct London: Hashable, Codable, Identifiable {
    
    // Unique id and name
    var id: Int
    var name: String
    
    fileprivate var imageName: String
    
    // Location information for map
    fileprivate var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // Image category
    var descriptiion: String
    var story: String
    var category: Category

    enum Category: String, CaseIterable, Codable, Hashable {
        case religion = "Religion"
        case park = "Park"
        case architecture = "Architecture"
        case education = "Education"
        case bridge = "Bridge"
        case modern = "Modern"
    }
    
    // Mark favoriate image
    var isFavorite: Bool
}

// Add images through extension
extension London {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

// Latitude and longtitude inforamtion
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
