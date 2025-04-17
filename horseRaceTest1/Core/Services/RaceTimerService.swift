//
//  RaceTimerService.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation

class RaceTimerService {
    
    private var raceTasks: [Task<Void, Never>] = []
    var onWinnerDetermined: ((Horse) -> Void)?
    
    func scheduleCompletion(for horse: Horse) {
        let task = Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(horse.speed * 1_000_000_000))
                onWinnerDetermined?(horse)
            } catch {
                print("Task cancelled or failed: \(error)")
            }
        }
        
        raceTasks.append(task)
    }
    
    func cancelAllTasks() {
        raceTasks.forEach { $0.cancel() }
        raceTasks.removeAll()
    }
}
