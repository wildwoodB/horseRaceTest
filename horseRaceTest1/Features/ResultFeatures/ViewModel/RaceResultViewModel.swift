//
//  RaceResultViewModel.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation
import Combine

class RaceResultViewModel: ObservableObject {
    
    @Published var history: [RaceResult] = []
    
    private var cancellables: AnyCancellable?
    private let storageService = StorageService()
    
    init(winnerPublisher: AnyPublisher<Horse?, Never>) {
        
        history = storageService.loadRaceResults()
        
        cancellables = winnerPublisher
            .compactMap { $0 }
            .sink { [weak self] horse in
                self?.appendResult(for: horse)
            }
    }
    
    private func appendResult(for horse: Horse) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = dateFormatter.string(from: Date())
        
        let newResult = RaceResult(date: date, winnerName: horse.name)
        
        history.insert(newResult, at: 0)
        
        storageService.saveRaceResults(history)
    }
    
    func clearHistory() {
        storageService.clearRaceResults()
        history = []
    }
}

extension RaceResultViewModel {
    static var mock: RaceResultViewModel {
        let mock = RaceResultViewModel(winnerPublisher: Just<Horse?>(nil).eraseToAnyPublisher())
        mock.history = [
            RaceResult(date: "17.04.2025 17:15", winnerName: "Буран"),
            RaceResult(date: "17.04.2025 17:05", winnerName: "Шторм")
        ]
        return mock
    }
}
