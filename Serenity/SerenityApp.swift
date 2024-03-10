//
//  SerenityApp.swift
//  Serenity
//
//  Created by Marcello Gonzatto Birkan on 08/03/24.
//

import SwiftUI

@main
struct SerenityApp: App {
    var body: some Scene {
        WindowGroup {
          MeditationView(meditationOO: MeditationOO(meditation: MeditationDO.data))
        }
    }
}
