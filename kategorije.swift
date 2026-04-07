import SwiftUI

enum Category: Equatable {
    case tech
    case sport(subcategory: SportsSubcategory)
    case lifestyle
    case politika
    case znanost

    var displayName: String {
        switch self {
        case .tech: return "Tehnologija"
        case .sport(let sub): return "Sport – \(sub.displayName)"
        case .lifestyle: return "Lifestyle"
        case .politika: return "Politika"
        case .znanost: return "Znanost"
        }
    }

    var color: Color {
        switch self {
        case .tech: return Color("plava")
        case .sport: return Color("zuta")
        case .lifestyle: return Color("roza")
        case .politika: return Color("ljubicasta")
        case .znanost: return Color("zelena")
        }
    }
}

enum SportsSubcategory: Equatable {
    case nogomet
    case košarka
    case tenis
    case formula1

    var displayName: String {
        switch self {
        case .nogomet: return "Nogomet"
        case .košarka: return "Košarka"
        case .tenis: return "Tenis"
        case .formula1: return "Formula 1"
        }
    }
}
