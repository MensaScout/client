//
//  MealCardView.swift
//  MensaScout
//
//  Created by Lars Winzer on 28.10.25.
//

import SwiftUI

struct MealCardView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: MealCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Thumbnail (optional)
            if let imageName = viewModel.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipped()
                    .cornerRadius(16)
            }

            // Title + Discription
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewModel.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(viewModel.nutrientPropertiesAssetNames, id: \.self) { assetName in
                            Image(assetName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .accessibilityLabel(assetName)
                        }
                    }
                }

                Text(viewModel.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Divider()

            // Price + Location
            HStack {
                Text(viewModel.pricesStudent)
                    .font(.subheadline)
                    .foregroundStyle(.primary)

                Spacer()

                Label(viewModel.location, systemImage: "mappin.and.ellipse")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

#Preview {
    let calendar = Calendar.current
    let today = Date()

    var startComponents = calendar.dateComponents([.year, .month, .day], from: today)
    startComponents.hour = 11
    startComponents.minute = 30

    var endComponents = startComponents
    endComponents.hour = 13
    endComponents.minute = 30

    let startDate = calendar.date(from: startComponents)!
    let endDate = calendar.date(from: endComponents)!

    let interval = DateInterval(start: startDate, end: endDate)
    
    let meal = Meal(
        name: "Trüffel Tagliatelle",
        description: "Hausgemachte Pasta mit frischem Trüffel, Parmesan und Sahnesauce.",
        nutrientProperties: [.beef],
        category: "Pasta of the Day",
        allergens: ["Gluten", "Dairy"],
        prices: MealPrices(student: 4.50, staff: 6.50, external: 10.70),
        location: "Mensa Biozentrum",
        imageName: "pasta",
        websiteURL: URL(string: "https://clients.compass-group.ch/unibas-biozentrum/en/BaCells"),
        openingHours: interval
    )
    
    return MealCardView(viewModel: MealCardViewModel(meal: meal))
}
