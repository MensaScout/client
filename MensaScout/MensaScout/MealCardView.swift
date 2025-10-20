//
//  MealCardView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct MealCardView: View {
    let meal: Meal

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Bild (optional)
            if let imageName = meal.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 160)
                    .clipped()
                    .cornerRadius(16)
            }

            // Titel & Beschreibung
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(meal.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(meal.nutrientProperties, id: \.self) { property in
                            Image(property.assetName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .accessibilityLabel(property.asString)
                        }
                    }
                }

                Text(meal.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Divider()

            // Preis & Ort
            HStack {
                Text(String(format: "%.2f CHF", meal.prices.student))
                    .font(.subheadline)
                    .foregroundStyle(.primary)

                Spacer()

                Label(meal.location, systemImage: "mappin.and.ellipse")
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
    
    return MealCardView(meal: Meal(
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
    ))
}
