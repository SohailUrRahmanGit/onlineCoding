//
//  Book.swift
//  BookList
//
//  Created by Sohail on 2024-01-31.
//

import Foundation

// Data model representing a book
struct Book: Codable {
    let name: String
    let numberOfPages: Int
    let released: String
}
