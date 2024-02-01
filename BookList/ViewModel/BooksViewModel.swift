//
//  BooksViewModel.swift
//  BookList
//
//  Created by Sohail on 2024-01-31.
//

import Foundation

// View model responsible for managing the list of books
class BooksViewModel: ObservableObject {
    @Published var books: [Book] = []
    
    private let networkingService: NetworkingServiceProtocol
    
    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService =  networkingService
    }
    
    // Fetch books asynchronously
    @MainActor
    func fetchBooks() async {
        do {
            self.books = try await networkingService.fetchBooks()
        } catch {
          print("Error in fetching books: \(error)")
        }
    }
}
