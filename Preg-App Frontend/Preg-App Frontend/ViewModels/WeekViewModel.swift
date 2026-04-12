//
//  WeekViewModel.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/12/26.
//

import Foundation
import SwiftUI
import Combine

class WeekViewModel: ObservableObject {
    
    @Published var current_week_data: Week?
    @Published var current_week: Int = 13
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let baseURL = "http://127.0.0.1:8000/home/"
    
    // MARK: - Fetch Week Data
    func fetchWeek() {
        guard let url = URL(string: "\(baseURL)\(current_week)") else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            // Handle network error
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            // Ensure data exists
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Week.self, from: data)
                
                DispatchQueue.main.async {
                    self.current_week_data = decoded
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode data"
                    print("Decoding error:", error)
                }
            }
            
        }.resume()
    }
    
    // MARK: - Navigation
    
    func nextWeek() {
        guard current_week < 40 else { return } // pregnancy max ~40 weeks
        current_week += 1
        fetchWeek()
    }
    
    func previousWeek() {
        guard current_week > 1 else { return }
        current_week -= 1
        fetchWeek()
    }
    
    // MARK: - Set Week (for future use like due date calc)
    
    func setWeek(_ week: Int) {
        guard week >= 1 && week <= 40 else { return }
        current_week = week
        fetchWeek()
    }
}
