//
//  SettingsView.swift
//  MensaScout
//
//  Created by Lars Winzer on 14.10.25.
//

import SwiftUI

struct SettingsView: View {
    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "–"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "–"
        return "Version \(version) (Build \(build))"
    }

    var body: some View {
        Form {
            Section("Info") {
                Text(appVersion)
                    .foregroundStyle(.secondary)
            }
            
            Text("Made with love by Lars Winzer")
        }
        .navigationTitle("Einstellungen")
    }
}

#Preview {
    SettingsView()
}
