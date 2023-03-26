//
//  RickAndMortyAPI.swift
//  Assignment3
//
//  Created by Peyton Scott on 3/26/23.
//
// RickAndMortyAPI.swift
import Foundation

struct PageInfo: Codable {
    let count: Int
    let pages: Int
}

class RickAndMortyAPI {
    private let baseURL = "https://rickandmortyapi.com/api/character"
    private(set) var nextPage: Int = 1
    private(set) var totalPages: Int = 1

    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        guard nextPage <= totalPages else { return }
        guard let url = URL(string: "\(baseURL)?page=\(nextPage)") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(apiResponse.results)
                }
                self.nextPage += 1
                self.totalPages = apiResponse.info.pages
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
