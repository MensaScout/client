//
//  MealCardViewModel.swift
//  MensaScoutTests
//
//  Created by Lars Winzer on 29.10.25.
//

import XCTest
@testable import MensaScout

@MainActor
final class MealCardViewModelTests: XCTestCase {
    private var sampleMeal: Meal!
    private var viewModel: MealCardViewModel!
    
    override func setUp() async throws {
        let now = Date()
        
        sampleMeal = Meal(
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
        
        viewModel = MealCardViewModel(meal: sampleMeal)
    }
    
    override func tearDown() {
        viewModel = nil
        sampleMeal = nil
    }
    
    func testImageName() {
        XCTAssertEqual(viewModel.imageName, "tortellini")
    }
    
    func testTitle() {
        XCTAssertEqual(viewModel.title, "Tortellini mit Rindfleisch")
    }
    
    func testNutrientPropertiesAssetNames() {
        XCTAssertEqual(viewModel.nutrientPropertiesAssetNames.first!, NutrientProperties.beef.assetName)
    }
    
    func testDescription() {
        XCTAssertEqual(viewModel.description, "Rindfleisch / Gemüsesauce / Schnittlauch / Menüsalat")
    }
    
    func testPricesStudent() {
        XCTAssertEqual(viewModel.pricesStudent, "9.50 CHF")
    }
    
    func testLocation() {
        XCTAssertEqual(viewModel.location, "ETH Science Lounge")
    }
}
