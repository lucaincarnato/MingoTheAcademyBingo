//
//  MingoTheAcademyBingoApp.swift
//  MingoTheAcademyBingo
//
//  Created by Luca Maria Incarnato on 08/02/25.
//

import SwiftUI
import SwiftData

@main
struct MingoTheAcademyBingoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: Scorecard.self)
    }
}
