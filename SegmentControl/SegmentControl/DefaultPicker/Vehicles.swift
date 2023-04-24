import Foundation
import SwiftUI

enum Vehicles: String, CaseIterable, Identifiable {
    case bike
    case car
    case plane
    case rocket
    
    var id: Self { self }
}

extension Vehicles {
    var indicatorImage: Image {
        switch self {
            
        case .bike:
           return Image("bike")
        case .car:
            return Image("car")
        case .plane:
            return Image("plane")
        case .rocket:
            return Image("rocket")
        }
    }
}
