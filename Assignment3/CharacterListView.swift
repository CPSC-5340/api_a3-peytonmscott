//
//  CharacterListView.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//
// CharacterListView.swift

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterRow(character: character)
                    }
                    .onAppear {
                        if character.id == viewModel.characters.last?.id {
                            viewModel.fetchCharacters()
                        }
                    }
                }
            }
            .navigationTitle("Rick and Morty Characters")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rick and Morty Characters")
                        .font(.headline)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
