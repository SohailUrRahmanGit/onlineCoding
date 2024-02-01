//
//  NetworkingService.swift
//  BookList
//
//  Created by Sohail on 2024-01-31.
//

import Foundation

// Protocol defining the networking service interface
protocol NetworkingServiceProtocol {
    func fetchBooks() async throws -> [Book]
}

// Concrete implementation of the networking service
class NetworkingService: NetworkingServiceProtocol {
    private let baseURL: String
    init(baseURL: String = API.baseURL) {
        self.baseURL = baseURL
    }
    
    // Fetch books from the API asynchronously
    func fetchBooks() async throws -> [Book] {
        guard let url = URL(string: API.bookList) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Book].self, from: data)
    }
}

