//
//  Webservice.swift
//  AsyncAwaitDates
//
//  Created by Isaac Iniongun on 27/05/2023.
//

import Foundation

class Webservice {
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("Invalid URL")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
