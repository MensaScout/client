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
                    Text(meal.type.symbol)
                        .font(.title2)
                        .padding(.trailing, 4)
                }

                Text(meal.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Divider()

            // Preis & Ort
            HStack {
                Label(String(format: "%.2f CHF", meal.priceCHF), systemImage: "banknote")
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
    MealCardView(meal: Meal(
        name: "Trüffel Tagliatelle",
        description: "Hausgemachte Pasta mit frischem Trüffel, Parmesan und Sahnesauce.",
        type: .vegetarian,
        priceCHF: 7.50,
        location: "Mensa Biozentrum",
        imageName: "pasta"
    ))
    .preferredColorScheme(.light)
}
