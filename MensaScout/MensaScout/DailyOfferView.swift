//
//  DailyOfferView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct DailyOfferView: View {
    let meals: [Meal] = [
        Meal(name: "Trüffel Tagliatelle", description: "Hausgemachte Pasta mit frischem Trüffel.", type: .vegetarian, priceCHF: 7.50, location: "Mensa Biozentrum", imageName: "pasta"),
        Meal(name: "Poulet Curry", description: "Hähnchenbrust in Kokos-Curry mit Reis.", type: .meat, priceCHF: 8.20, location: "Cafeteria Petersplatz", imageName: "curry"),
        Meal(name: "Falafel Bowl", description: "Kichererbsen, Quinoa und frische Kräuter.", type: .vegan, priceCHF: 7.00, location: "Uni Café", imageName: "falafel")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(meals) { meal in
                    MealCardView(meal: meal)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Tagesangebot")
    }
}

#Preview {
    DailyOfferView()
}
