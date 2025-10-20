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
                // Thumbnail
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

                // Title + Category
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
                
                // Description
                Text(meal.description)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)

                // Nutritional properties
                if !meal.nutrientProperties.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Nährstoffeigenschaften")
                            .font(.headline)
                        
                        Text(meal.nutrientProperties.map { $0.asString }.joined(separator: ", "))
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                }

                // Allergens
                if !meal.allergens.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Allergene")
                            .font(.headline)
                        Text(meal.allergens.joined(separator: ", "))
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                }

                // Price
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

                // Mensa location
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(meal.location)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                
                // Opening hours
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "clock")
                            Text(openingHoursText)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(openingHoursStatus)
                    }
                    .padding(.horizontal)
                }

                // Button to website
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
    
    private var openingHoursText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let start = formatter.string(from: meal.openingHours.start)
        let end = formatter.string(from: meal.openingHours.end)
        
        return "\(start) - \(end) Uhr"
    }
    
    private var openingHoursStatus: String {
        let now = Date()
        let openingHours = meal.openingHours
        
        if openingHours.contains(now) {
            let timeRemaining = openingHours.end.timeIntervalSince(now)
            if timeRemaining < 15 * 60 {
                return "schließt bald"
            } else {
                return "geöffnet"
            }
        } else if now < openingHours.start {
            let timeUntilOpen = openingHours.start.timeIntervalSince(now)
            if timeUntilOpen < 15 * 60 {
                return "öffnet bald"
            } else {
                return "geschlossen"
            }
        } else {
            return "geschlossen"
        }
    }
}


#Preview {
    let calendar = Calendar.current
    let today = Date()

    var startComponents = calendar.dateComponents([.year, .month, .day], from: today)
    startComponents.hour = 14
    startComponents.minute = 00

    var endComponents = startComponents
    endComponents.hour = 15
    endComponents.minute = 00

    let startDate = calendar.date(from: startComponents)!
    let endDate = calendar.date(from: endComponents)!

    let interval = DateInterval(start: startDate, end: endDate)
    
    return MealDetailView(meal: Meal(
        name: "Falafel Bowl",
        description: "Kichererbsen, Quinoa und frische Kräuter, serviert mit Tahini-Dressing.",
        nutrientProperties: [.vegan],
        category: "Plants & More",
        allergens: ["Sesam", "Soja"],
        prices: MealPrices(student: 7.00, staff: 8.50, external: 10.50),
        location: "Uni Café",
        imageName: nil,
        websiteURL: URL(string: "https://www.mensa.unibas.ch"),
        openingHours: interval
    ))
}
