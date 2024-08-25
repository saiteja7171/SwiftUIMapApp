//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Sai Teja Atluri on 6/18/24.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
