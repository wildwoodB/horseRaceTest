//
//  StorageService.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation

class StorageService {
    
    private enum Constants {
        static let raceResultsKey = "horse_race_history"
    }
    
    func saveRaceResults(_ results: [RaceResult]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(results)
            UserDefaults.standard.set(data, forKey: Constants.raceResultsKey)
        } catch {
            print("Error saving race results: \(error)")
        }
    }
    
    func loadRaceResults() -> [RaceResult] {
        guard let data = UserDefaults.standard.data(forKey: Constants.raceResultsKey) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([RaceResult].self, from: data)
        } catch {
            print("Error loading race results: \(error)")
            return []
        }
    }
    
    func clearRaceResults() {
        UserDefaults.standard.removeObject(forKey: Constants.raceResultsKey)
    }
}
