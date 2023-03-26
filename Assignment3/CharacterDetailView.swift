//
//  CharacterDetailView.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//
// CharacterDetailView.swift

import SwiftUI

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .padding(.top)

                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)

                Text("Status: \(character.status)")
                    .font(.headline)
                Text("Species: \(character.species)")
                    .font(.headline)
                Text("Type: \(character.type.isEmpty ? "Unknown" : character.type)")
                    .font(.headline)
                Text("Gender: \(character.gender)")
                    .font(.headline)

                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/location/1"))
    }
}
