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
            
            NavigationLink("Special Thanks & Attributions") {
                Form {
                    Section(header: Text("Credits")) {
                        Link("OpenMoji", destination: URL(string: "https://openmoji.org/")!)
                    }
                    
                    Section(header: Text("Contributors")) {
                        Link("Lars Winzer", destination: URL(string: "https://github.com/official-Cromatin")!)
                    }
                    
                    Link("Repository (GitHub)", destination: URL(string: "https://github.com/official-Cromatin/Mensa-Scout")!)
                }
            }
        }
        .navigationTitle("Einstellungen")
    }
}

#Preview {
    SettingsView()
}
