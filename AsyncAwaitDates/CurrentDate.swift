//
//  CurrentDate.swift
//  AsyncAwaitDates
//
//  Created by Isaac Iniongun on 27/05/2023.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
