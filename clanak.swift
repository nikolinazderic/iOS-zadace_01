import SwiftUI

struct Clanak: Equatable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let content: String
    let imageURL: URL
    let publishedAt: Date
    let author: String?
    let category: Category
    private(set) var ratings: [Double]

    var averageRating: Double {
        guard !ratings.isEmpty else { return 0 }
        return ratings.reduce(0, +) / Double(ratings.count)
    }

    var titleColor: Color {
        category.color
    }

    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        content: String,
        imageURL: URL,
        publishedAt: Date,
        author: String? = nil,
        category: Category,
        ratings: [Double] = []
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.content = content
        self.imageURL = imageURL
        self.publishedAt = publishedAt
        self.author = author
        self.category = category
        self.ratings = ratings
    }

    mutating func addRating(_ rating: Double) {
        ratings.append(rating)
    }
}

extension Clanak {
    static let mock1 = Clanak(
        title: "Kinin petogodišnji plan za korištenje AI-a",
        description: "Kinina vlada je odobrila plan koji opisuje njihove ciljeve i kako im AI može pomoći u ostvarenju tih ciljeva.",
        content: "AI se sve više i više koristi u dnevnom životu te Kina to planira iskoristiti.",
        imageURL: URL(string: "https://www.artificialintelligence-news.com/wp-content/uploads/2026/04/five-year-plan-hero_x1440-1024x685.webp")!,
        publishedAt: Date(),
        author: "Ana Kovačić",
        category: .tech,
        ratings: [4.5, 4.0, 3.5]
    )

    static let mock2 = Clanak(
        title: "Mercedes dominira u Japanu",
        description: "Kimi Antonelli je Mercedesu osigurao još jednu pobjedu",
        content: "U trećoj utrci sezone Mercedesov auto nastavlja dominirati, a prate ga McLarren Oscara Piastria i Ferrari Charlesa Leclerca. ",
        imageURL: URL(string: "https://images.ctfassets.net/1fvlg6xqnm65/5ShOrY95wQdCn4MoAYX6NQ/03e479ad87eef7fe972bc1998bcd2be2/01-M591291.jpg?w=1920&q=75&fm=webp")!,
        publishedAt: Calendar.current.date(byAdding: .hour, value: -3, to: Date())!,
        author: "Tomislav Berić",
        category: .sport(subcategory: .formula1),
        ratings: [4.5, 5.0, 4.5]
    )

    static let mock3 = Clanak(
        title: "Love Island dolazi u Hrvatsku!",
        description: "Otvorene su prijave za Love ISland Adria.",
        content: "Svjetski poznata reality TV serija dolazi u Hrvtasku.",
        imageURL: URL(string: "https://i.ytimg.com/vi/tvttimIQLS4/hqdefault.jpg")!,
        publishedAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
        category: .lifestyle,
        ratings: [3.5, 3.0, 4.5]
    )

    static let mock4 = Clanak(
        title: "Novosti o ratu u Iranu",
        description: "Trump prijeti uništenju cijelog Irana ako se ne otvori Hormuški tjesanac.",
        content: "Rat u Iranu idalje traje, a cijene goriva rastu.",
        imageURL: URL(string: "https://ichef.bbci.co.uk/ace/standard/1024/cpsprodpb/e745/live/d40e9650-2d52-11f1-8287-670af2c7ae92.jpg")!,
        publishedAt: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
        author: "Maja Horvat",
        category: .politika,
        ratings: [4.0, 4.0, 3.5]
    )

    static let mock5 = Clanak(
        title: "Astronauti Artemisa II stižu na Mjesec",
        description: "NASA - in Artemis II je nakon dugogodišnjeg čekanja uspješno prešao put do Mjeseca.",
        content: "Nakon dugogodišnjeg čekanja astronauti Artemisa II su uspješno stigli na Mjesec",
        imageURL: URL(string: "https://img.24sata.hr/OjaFXj1ccu9LgjD8VYjG_QWNdkA=/776x430/smart/media/images/2026-14/2026-04-03t214148z-255786602-rc2thkapxhys-rtrmadp-3-space-moon-artemis.jpg")!,
        publishedAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
        author: "Ivan Perić",
        category: .znanost,
        ratings: [3.5, 5.0, 3.5]
    )

    static let mockClanaci: [Clanak] = [mock1, mock2, mock3, mock4, mock5]
}
