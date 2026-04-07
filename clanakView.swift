import SwiftUI

struct ClanakView: View {
    let clanak: Clanak

    var body: some View {
        HStack(alignment: .center, spacing: 15) {

            AsyncImage(url: clanak.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Rectangle()
                    .foregroundStyle(.secondary.opacity(0.3))
            }
            .frame(width: 120, height: 100)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 3) {
                HStack {
                        CategoryBadge(category: clanak.category)
                        
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                            
                            Text(String(format: "%.1f", clanak.averageRating))
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                        }
                    }

                Text(clanak.title)
                    .font(.headline)
                    .foregroundStyle(clanak.titleColor)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)


                Text(clanak.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(20)
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .primary.opacity(0.1), radius: 16)
    }
}

struct CategoryBadge: View {
    let category: Category

    var body: some View {
        Text(category.displayName)
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(category.color.opacity(0.35))
            .foregroundStyle(category.color)
            .clipShape(Capsule())
    }
}

#Preview {
    ClanakView(clanak: .mock1)
        .padding()
}
