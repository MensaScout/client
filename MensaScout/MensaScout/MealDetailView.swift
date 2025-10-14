//
//  MealDetailView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Bild oben
                if let imageName = meal.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 220)
                        .clipped()
                        .cornerRadius(16)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                }

                // Titel + Kategorie
                VStack(alignment: .leading, spacing: 6) {
                    Text(meal.name)
                        .font(.largeTitle.bold())
                        .padding(.horizontal)

                    if let category = meal.category {
                        Text(category)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, imageNameExists ? 0 : 20)

                Divider()
                    .padding(.horizontal)

                // Beschreibung
                Text(meal.description)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)

                // Typ (Vegan, etc.)
                HStack(spacing: 10) {
                    Text(meal.type.symbol)
                        .font(.title3)
                    Text(meal.type.rawValue)
                        .font(.headline)
                        .foregroundStyle(meal.type.color)
                }
                .padding(.horizontal)

                // Allergene
                if !meal.allergens.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Allergene")
                            .font(.headline)
                        Text(meal.allergens.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                }

                // Preise
                VStack(alignment: .leading, spacing: 6) {
                    Text("Preise")
                        .font(.headline)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Studierende:")
                            Text("Angestellte:")
                            Text("Externe:")
                        }
                        .foregroundStyle(.secondary)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(String(format: "%.2f CHF", meal.prices.student))
                            Text(String(format: "%.2f CHF", meal.prices.staff))
                            Text(String(format: "%.2f CHF", meal.prices.external))
                        }
                        .font(.body)
                    }
                }
                .padding(.horizontal)

                // Ort
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(meal.location)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

                // Website-Button
                if let url = meal.websiteURL {
                    Link(destination: url) {
                        Text("Zur Webseite")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                }

                Spacer(minLength: 40)
            }
            .padding(.top)
        }
        .presentationDetents([.medium, .large]) // <- Slide-Over Karte
        .presentationDragIndicator(.visible)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Schließen") {
                    dismiss()
                }
            }
        }
    }

    private var imageNameExists: Bool {
        meal.imageName != nil
    }
}


#Preview {
    MealDetailView(meal: Meal(
        name: "Falafel Bowl",
        description: "Kichererbsen, Quinoa und frische Kräuter, serviert mit Tahini-Dressing.",
        type: .vegan,
        category: "Plants & More",
        allergens: ["Sesam", "Soja"],
        prices: MealPrices(student: 7.00, staff: 8.50, external: 10.50),
        location: "Uni Café",
        imageName: "falafel",
        websiteURL: URL(string: "https://www.mensa.unibas.ch")
    ))
}
