//
//  DailyOfferView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct DailyOfferView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Today's Offer")
                .font(.title)
                .bold()
            Text("Pasta of the Day")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    DailyOfferView()
}
