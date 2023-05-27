//
//  ContentView.swift
//  AsyncAwaitDates
//
//  Created by Isaac Iniongun on 27/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var currentDateListViewModel = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            List(currentDateListViewModel.currentDates) { currentDate in
                Text(currentDate.date)
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await currentDateListViewModel.getDates()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await currentDateListViewModel.getDates()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
