//
//  WeekViewModel.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/12/26.
//

import Foundation
import SwiftUI
import Combine

// WeekViewModel is a class because data held here needs to be persistent and shared elsewhere.
// ObservableObject is due to some of the variables changing (changing state), where other places
// are notified.
class WeekViewModel: ObservableObject {
    
    // Published tell ObservableObject which variables change.
    @Published var current_week_data: Week?
    @Published var current_week: Int = 1
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // Handles the call to API Services to make a request to the backend for week data.
    func fetchWeek() {
        isLoading = true
        errorMessage = nil

        APIService.shared.fetchWeek(week: current_week) { result in
            
            // As soon as a result is achieved from API Service, DispatchQueue.main ensures updates are put
            // onto the main thread queue, where UI is meant to be updated. Async allows for this to run without
            // puting the whole app on pause.
            DispatchQueue.main.async {
                self.isLoading = false

                // The result of the API Service HTTP request determines which case is ran.
                switch result {
                case .success(let week):
                    self.current_week_data = week

                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // Handles week traversal forward.
    func nextWeek() {
        guard current_week < 40 else { return }
        current_week += 1
        fetchWeek()
    }
    
    // Handles week traversal backward.
    func previousWeek() {
        guard current_week > 1 else { return }
        current_week -= 1
        fetchWeek()
    }
    
    // Helps to set the inital week on the home page to the user's current week of pregnancy.
    // The _ in the week parameter ensure just the week value is inputted, not the week label.
    // i.e. 3 not week: 3
    func setWeek(_ week: Int) {
        self.current_week = week
        fetchWeek()
    }
    
}
