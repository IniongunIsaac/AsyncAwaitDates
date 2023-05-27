//
//  CurrentDateListViewModel.swift
//  AsyncAwaitDates
//
//  Created by Isaac Iniongun on 27/05/2023.
//

import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func getDates() async {
        do {
            if let currentDate = try await Webservice().getDate() {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                currentDates.append(currentDateViewModel)
            }
        } catch  {
            print(error)
        }
    }
}

struct CurrentDateViewModel: Identifiable {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
