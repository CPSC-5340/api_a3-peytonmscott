//
//  APIResponse.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//
// APIResponse.swift

import Foundation

struct APIResponse: Codable {
    let info: PageInfo
    let results: [Character]
}


// Character.swift
import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
