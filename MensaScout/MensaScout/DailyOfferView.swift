//
//  DailyOfferView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct DailyOfferView: View {
    @State private var selectedMeal: Meal?

    var openingInterval: DateInterval {
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
        return DateInterval(start: startDate, end: endDate)
    }

    var meals: [Meal] {
        [
            Meal(
                name: "Pasta mit Planted Duck an Orangensauce",
                description: "Pasta mit Planted Duck, Orangensauce, Rotkraut und Kürbiskernpesto",
                nutrientProperties: [.vegan],
                category: "Pasta of the Day",
                allergens: [],
                prices: MealPrices(student: 14.00, staff: 14.00, external: 17.50),
                location: "ETH Flavour Kitchen",
                imageName: "pasta",
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Okaratätschli & Süsskartoffel-Püree",
                description: "Randen-Okara Tätschli mit Pak Choi und Süsskartoffel-Limetten-Püree",
                nutrientProperties: [.vegan],
                category: "Plants & More",
                allergens: [],
                prices: MealPrices(student: 14.00, staff: 14.00, external: 17.50),
                location: "ETH Flavour Kitchen",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Hirschgeschnetzeltes & Spätzli",
                description: "Hirschgeschnetzeltes mit Rahmsauce, Preiselbeeren, Spätzli und geröstetem Rosenkohl",
                nutrientProperties: [],
                category: "Classic Flavour",
                allergens: [],
                prices: MealPrices(student: 14.00, staff: 14.00, external: 17.50),
                location: "ETH Flavour Kitchen",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Marronicremesuppe & Steinpilzen",
                description: "Marronicremesuppe mit Steinpilzen, Croûtons mit Rosmarin und Brotscheibe",
                nutrientProperties: [.vegetarian],
                category: "Weekly Bowl",
                allergens: [],
                prices: MealPrices(student: 10.80, staff: 10.80, external: 13.50),
                location: "ETH Flavour Kitchen",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Randenrisotto mit Brie",
                description: "Risotto mit Randen, Reibkäse, Brie, Baumnuss und Birne",
                nutrientProperties: [.vegetarian],
                category: "Vital",
                allergens: [],
                prices: MealPrices(student: 7.50, staff: 11.50, external: 13.50),
                location: "ETH Science Lounge",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Chicken Nuggets & Wedges",
                description: "Chicken Nuggets mit Ketchup, Kartoffel Wedges, Zucchetti und Kräutern",
                nutrientProperties: [.poultry],
                category: "Classic",
                allergens: [],
                prices: MealPrices(student: 9.50, staff: 12.50, external: 15.50),
                location: "ETH Science Lounge",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Salatbuffet in Selbstbedienung",
                description: "Wechselnde Auswahl an Blatt-, Rohkost- sowie angemachten Salaten mit Dressings, Öl und Essig",
                nutrientProperties: [.vegetarian],
                category: "Salat & Antipasti",
                allergens: [],
                prices: MealPrices(student: 2.20, staff: 2.50, external: 3.10),
                location: "ETH Science Lounge",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Chili con Carne, Beef (CH)",
                description: "Reis, Mais, Nachos, Cheese Dip und Sour Cream",
                nutrientProperties: [.beef],
                category: "Around the World",
                allergens: [],
                prices: MealPrices(student: 9.50, staff: 12.00, external: 15.00),
                location: "Mensa Biozentrum",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Mexican Bowl",
                description: "Lime Sauce, Kichererbsen, rote Bohnen, Gurken, Rotkohl und Oliven",
                nutrientProperties: [.vegan, .green_choice],
                category: "Green Choice",
                allergens: [],
                prices: MealPrices(student: 7.50, staff: 10.00, external: 12.00),
                location: "Mensa Biozentrum",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            ),
            Meal(
                name: "Vegane Gyoza",
                description: "Fried Rice und Wok-Gemüse",
                nutrientProperties: [.vegan],
                category: "Brasserie",
                allergens: [],
                prices: MealPrices(student: 15.00, staff: 17.50, external: 19.50),
                location: "Mensa Biozentrum",
                imageName: nil,
                websiteURL: nil,
                openingHours: openingInterval
            )
        ]
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(meals) { meal in
                    MealCardView(viewModel: MealCardViewModel(meal: meal))
                    .onTapGesture {
                        selectedMeal = meal
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Tagesangebot")
        .sheet(item: $selectedMeal) { meal in
            MealDetailView(viewModel: MealDetailViewModel(meal: meal))
        }
    }
}

#Preview {
    DailyOfferView()
}
