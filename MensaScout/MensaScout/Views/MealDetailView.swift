import SwiftUI

struct MealDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: MealDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Thumbnail
                if let imageName = viewModel.imageName {
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
                    Text(viewModel.title)
                        .font(.largeTitle.bold())
                        .padding(.horizontal)

                    if let category = viewModel.category {
                        Text(category)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, viewModel.imageExists ? 0 : 20)

                Divider()
                    .padding(.horizontal)
                
                // Description
                Text(viewModel.description)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.horizontal)

                // Nutrient properties
                if let nutrientPropertiesText = viewModel.nutrientPropertiesText {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Nährstoffeigenschaften")
                            .font(.headline)
                        
                        Text(nutrientPropertiesText)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                }

                // Allergens
                if let allergensText = viewModel.allergensText {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Allergene")
                            .font(.headline)
                        Text(allergensText)
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
                            ForEach(viewModel.pricesText, id: \.0) { row in
                                Text("\(row.0):")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            ForEach(viewModel.pricesText, id: \.0) { row in
                                Text(row.1)
                            }
                        }
                    }
                }
                .padding(.horizontal)

                // Mensa location
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(viewModel.locationText)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                
                // Opening hours
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "clock")
                            Text(viewModel.openingHoursText)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(viewModel.openingHoursStatus)
                    }
                    .padding(.horizontal)
                }

                // Button to website
                if let url = viewModel.websiteURL {
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
}

#Preview {
    let calendar = Calendar.current
    let today = Date()
    
    var start = calendar.dateComponents([.year, .month, .day], from: today)
    start.hour = 14
    let startDate = calendar.date(from: start)!
    
    var end = start
    end.hour = 15
    let endDate = calendar.date(from: end)!
    
    let meal = Meal(
        name: "Falafel Bowl",
        description: "Kichererbsen, Quinoa und frische Kräuter, serviert mit Tahini-Dressing.",
        nutrientProperties: [.vegan],
        category: "Plants & More",
        allergens: ["Sesam", "Soja"],
        prices: MealPrices(student: 7.00, staff: 8.50, external: 10.50),
        location: "Uni Café",
        imageName: nil,
        websiteURL: URL(string: "https://www.mensa.unibas.ch"),
        openingHours: DateInterval(start: startDate, end: endDate)
    )
    
    return MealDetailView(viewModel: MealDetailViewModel(meal: meal))
}

