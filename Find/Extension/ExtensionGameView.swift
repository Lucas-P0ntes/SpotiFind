//
//  ExtensionGameView.swift
//  Find
//
//  Created by Lucas Pontes on 04/07/23.
//

import SwiftUI

extension GameView {
    
    
    private func artistNameExists() -> Bool {
        return api.users.contains { $0.name?.lowercased() == searchText.lowercased() }
    }
    
    private func buscarArtist() {
        Task {
            do {
                try await api.buscar()
            } catch {
                print("Error", error)
            }
        }
        searchText = ""
    }
    
    public func onNextButtonTapped() {
        score -= 5
         buscarArtist()
    }
    public func onSearchButtonTapped() {
        let artistExists = artistNameExists()
        score += artistExists ? 10 : -10
         buscarArtist()
    }
    
    
}
