//
//  CharacterRow.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//
// CharacterRow.swift

import SwiftUI

struct CharacterRow: View {
    let character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(.green)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/location/1"))
    }
}
