//
//  MealDetailViewModelTests.swift
//  MensaScoutTests
//
//  Created by Lars Winzer on 23.10.25.
//

import XCTest
@testable import MensaScout

final class MealDetailViewModelTests: XCTestCase {
    private var sampleMeal: Meal!
    private var viewModel: MealDetailViewModel!
    
    override func setUp() async throws {
        let now = Date()
        
        sampleMeal = await Meal(
            name: "Tortellini mit Rindfleisch",
            description: "Rindfleisch / Gemüsesauce / Schnittlauch / Menüsalat",
            nutrientProperties: [.beef],
            category: "CLASSIC",
            allergens: ["Gluten", "Ei", "Sellerie", "Senf", "Sulfite"],
            prices: MealPrices(student: 9.50, staff: 12.50, external: 15.50),
            location: "ETH Science Lounge",
            imageName: "tortellini",
            websiteURL: URL(string: "https://ethz.ch"),
            openingHours: DateInterval(start: now, end: now)
        )
        
        viewModel = await MainActor.run {
            MealDetailViewModel(meal: sampleMeal)
        }
    }
    
    override func tearDown() {
        viewModel = nil
        sampleMeal = nil
    }
    
    @MainActor
    func testNutrientPropertiesText() {
        XCTAssertEqual(viewModel.nutrientPropertiesText, "Beef")
    }
    
    @MainActor
    func testAllergensText() {
        XCTAssertEqual(viewModel.allergensText, "Gluten, Ei, Sellerie, Senf, Sulfite")
    }
    
    @MainActor
    func testPricesTextFormatting() {
        let prices = viewModel.pricesText
        XCTAssertEqual(prices.count, 3)
        XCTAssertEqual(prices.first?.0, "Studierende")
        XCTAssertEqual(prices.first?.1, "9.50 CHF")
    }
    
    @MainActor
    func testOpeningHoursFormatting() {
        let text = viewModel.openingHoursText
        
        let pattern = #"^\d{2}:\d{2} - \d{2}:\d{2} Uhr$"#
        
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: text.utf16.count)
        let match = regex.firstMatch(in: text, range: range)
        
        XCTAssertNotNil(match, "Opening hours text format is invalid: \(text)")
    }
    
    @MainActor
    func testOpeningHoursStatusVariants() async {
        let now = Date()
        let cases: [(DateInterval, String)] = [
            (DateInterval(start: now.addingTimeInterval(-3600), end: now.addingTimeInterval(3600)), "geöffnet"),
            (DateInterval(start: now.addingTimeInterval(-300), end: now.addingTimeInterval(600)), "schließt bald"),
            (DateInterval(start: now.addingTimeInterval(600), end: now.addingTimeInterval(7200)), "öffnet bald"),
            (DateInterval(start: now.addingTimeInterval(-7200), end: now.addingTimeInterval(-3600)), "geschlossen")
        ]
        
        for (interval, expected) in cases {
            let meal = sampleMeal!
            let testMeal = Meal(
                name: meal.name,
                description: meal.description,
                nutrientProperties: meal.nutrientProperties,
                category: meal.category,
                allergens: meal.allergens,
                prices: meal.prices,
                location: meal.location,
                imageName: meal.imageName,
                websiteURL: meal.websiteURL,
                openingHours: interval
            )
            
            let vm = await MainActor.run {
                MealDetailViewModel(meal: testMeal)
            }
            XCTAssertEqual(vm.openingHoursStatus, expected)
        }
    }
}

