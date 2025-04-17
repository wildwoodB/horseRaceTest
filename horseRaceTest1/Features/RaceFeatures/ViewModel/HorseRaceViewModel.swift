//
//  HorseRaceViewModel.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation
import SwiftUI

class HorseRaceViewModel: ObservableObject {
    
    @Published var horses: [Horse] = []
    @Published var horseOffsets: [UUID: CGFloat] = [:]
    @Published var raceFinished = false
    @Published var winner: Horse?
    @Published var animationRunning: Bool = false
    
    private let timerService = RaceTimerService()
    private let screenWidth = UIScreen.main.bounds.width
    
    init() {
        timerService.onWinnerDetermined = { [weak self] horse in
            Task {
                await MainActor.run {
                    guard let self = self, !self.raceFinished else { return }
                    
                    self.raceFinished = true
                    self.winner = horse
                    self.animationRunning = false
                }
            }
        }
    }
    
    func generateRace() {
        let horse1 = Horse(name: randomName(),
                       imageFrames: ["Horse-Frame1", "Horse-Frame2", "Horse-Frame3"],
                       speed: Double.random(in: HorseRaceConfig.minSpeed...HorseRaceConfig.maxSpeed))
        let horse2 = Horse(name: randomName(),
                       imageFrames: ["Horse-Frame1", "Horse-Frame2", "Horse-Frame3"],
                       speed: Double.random(in: HorseRaceConfig.minSpeed...HorseRaceConfig.maxSpeed))
        
        horses = [horse1, horse2]
        horseOffsets = [horse1.id: HorseRaceConfig.horseOffset, horse2.id: HorseRaceConfig.horseOffset]
        raceFinished = false
        winner = nil
    }
    
    func startRace() {
        generateRace()
        timerService.cancelAllTasks()
        
        animationRunning = true
        raceFinished = false
        winner = nil
        
        for horse in horses {
            animateHorse(horse)
            timerService.scheduleCompletion(for: horse)
        }
    }
    
    private func animateHorse(_ horse: Horse) {
        withAnimation(.linear(duration: horse.speed)) {
            horseOffsets[horse.id] = screenWidth + HorseRaceConfig.endOffsetPadding
        }
    }
    
    private func randomName() -> String {
        ["Гемблер", "Беттер", "Лудик", "Виннер", "Лакер", "Буран"].randomElement() ?? "Конь"
    }
}

extension HorseRaceViewModel {
    static var mock: HorseRaceViewModel {
        let mock = HorseRaceViewModel()
        return mock
    }
}
