//
//  CharacterListViewModel.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//

import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    private let api = RickAndMortyAPI()

    init() {
        fetchCharacters()
    }

    func fetchCharacters() {
        api.fetchCharacters { [weak self] newCharacters in
            self?.characters.append(contentsOf: newCharacters)
        }
    }
}

