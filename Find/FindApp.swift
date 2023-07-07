//
//  FindApp.swift
//  Find
//
//  Created by Lucas Pontes on 01/07/23.
//

import SwiftUI

@main
struct FindApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView() .environmentObject(API())
        }
    }
}
