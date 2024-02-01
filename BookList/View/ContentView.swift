//
//  ContentView.swift
//  BookList
//
//  Created by Sohail on 2024-01-31.
//

import SwiftUI

// Responsible for displaying the list of books
struct ContentView: View {
    @ObservedObject var viewModel: BooksViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.books, id: \.name) { book in
                VStack(alignment: .leading) {
                    Text(book.name)
                        .font(.headline)
                    Text("Number of pages: \(book.numberOfPages)")
                    Text("Released: \(book.released.formatDate())")
                }
                .padding()
            }
            .navigationTitle("Game of Thrones")
        }
        .task {
            await viewModel.fetchBooks() // Fetch books when the view appears

        }
    }
}

// SwiftUI preview for ContentView
#Preview {
    let viewModel = BooksViewModel(networkingService: NetworkingService())
    viewModel.books = [Book(name: "A Game of Thrones", numberOfPages: 694, released: "1996-08-01T00:00:00")]
    return ContentView(viewModel: viewModel)
}
