//
//  RaceResultView.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import SwiftUI

struct RaceResultView: View {
    
    @ObservedObject var viewModel: RaceResultViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.history) { record in
                VStack(alignment: .leading, spacing: 4) {
                    Text("🏆 Победитель: \(record.winnerName)")
                        .font(.headline)
                    Text(record.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("История")
            .toolbar {
                Button("Очистить") {
                    viewModel.clearHistory()
                }
            }
        }
    }
}

#Preview {
    RaceResultView(viewModel: RaceResultViewModel.mock)
}
