//
//  ContentView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DailyOfferView()
                    .navigationTitle("Tagesangebot")
            }
            .tabItem {
                Label("Tagesangebot", systemImage: "sun.max.fill")
            }

            NavigationStack {
                SettingsView()
                    .navigationTitle("Einstellungen")
            }
            .tabItem {
                Label("Einstellungen", systemImage: "gearshape.fill")
            }
        }
    }
}


#Preview {
    ContentView()
}
