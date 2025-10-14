//
//  DailyOfferView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct DailyOfferView: View {
    @State private var selectedMeal: Meal?
    let meals: [Meal] = [
        Meal(
            name: "Trüffel Tagliatelle",
            description: "Hausgemachte Pasta mit frischem Trüffel und Sahnesauce.",
            nutrientProperties: [.vegetarian, .green_choice],
            category: "Classic Flavour",
            allergens: ["Gluten", "Milch"],
            prices: MealPrices(student: 7.50, staff: 9.00, external: 11.00),
            location: "Mensa Biozentrum",
            imageName: "pasta",
            websiteURL: URL(string: "https://www.unibas.ch/de/Mensa.html")
        ),
        Meal(
            name: "Falafel Bowl",
            description: "Kichererbsen, Quinoa und frische Kräuter, serviert mit Tahini-Dressing.",
            nutrientProperties: [.vegan],
            category: "Plants & More",
            allergens: ["Sesam", "Soja"],
            prices: MealPrices(student: 7.00, staff: 8.50, external: 10.50),
            location: "Uni Café",
            imageName: "falafel",
            websiteURL: URL(string: "https://www.mensa.unibas.ch")
        )
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(meals) { meal in
                    MealCardView(meal: meal)
                        .onTapGesture {
                            selectedMeal = meal
                        }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Tagesangebot")
        .sheet(item: $selectedMeal) { meal in
            MealDetailView(meal: meal)
        }
    }
}

#Preview {
    DailyOfferView()
}
