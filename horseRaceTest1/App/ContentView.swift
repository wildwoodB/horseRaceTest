//
//  ContentView.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var raceVM: HorseRaceViewModel
    @StateObject private var historyVM: RaceResultViewModel
    
    init() {
        let race = HorseRaceViewModel()
        _raceVM = StateObject(wrappedValue: race)
        _historyVM = StateObject(wrappedValue: RaceResultViewModel(winnerPublisher: race.$winner.eraseToAnyPublisher()))
    }
    
    var body: some View {
        TabView {
            HorseRaceView(viewModel: raceVM)
                .tabItem {
                    Label("Гонка", systemImage: "hare")
                }
            
            RaceResultView(viewModel: historyVM)
                .tabItem {
                    Label("История", systemImage: "clock")
                }
        }
    }
}

#Preview {
    ContentView()
}
