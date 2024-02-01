//
//  BookListApp.swift
//  BookList
//
//  Created by Sohail on 2024-01-31.
//

import SwiftUI

@main
struct BookListApp: App {
    var body: some Scene {
        WindowGroup {
            // Create an instance of the BooksViewModel with the NetworkingService as a dependency
            let viewModel =  BooksViewModel(networkingService: NetworkingService())
            
            // Set up the ContentView with the BooksViewModel
            ContentView(viewModel: viewModel)
        }
    }
}
