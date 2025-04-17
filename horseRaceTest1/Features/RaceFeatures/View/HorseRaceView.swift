//
//  HorseRaceView.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import SwiftUI

struct HorseRaceView: View {
    
    @ObservedObject var viewModel: HorseRaceViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            horsesSection
            controlsSection
            winnerSection
        }
        .onAppear {
            viewModel.generateRace()
        }
    }
}

extension HorseRaceView {
    private var horsesSection: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.horses) { horse in
                Text(horse.name)
                    .font(.title)
                HorseTrackView(
                    isRunning: $viewModel.animationRunning,
                    horse: horse,
                    offset: viewModel.horseOffsets[horse.id] ?? HorseRaceConfig.horseOffset
                )
                
                horseRaceLineSeparator
            }
        }
    }
    
    private var controlsSection: some View {
        Button {
            viewModel.startRace()
        } label: {
            Text("СТАРТ")
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .font(.title)
                .background(Color.red)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
    
    private var winnerSection: some View {
        Text("🏆 Победитель: \(viewModel.winner?.name ?? "")")
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .opacity(viewModel.winner == nil ? 0 : 1)
    }
    
    var horseRaceLineSeparator: some View {
        LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing)
            .frame(maxWidth: .infinity, maxHeight: 5)
            .padding([.top], -5)
    }
}

#Preview {
    HorseRaceView(viewModel: HorseRaceViewModel.mock)
}
