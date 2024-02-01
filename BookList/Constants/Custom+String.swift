//
//  String+Date.swift
//  BookList
//
//  Created by Sohail on 2024-02-01.
//

import Foundation

// Extension to format date strings
extension String {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // Assuming the input format is "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd-MM-yyyy" // Desired output format
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}
