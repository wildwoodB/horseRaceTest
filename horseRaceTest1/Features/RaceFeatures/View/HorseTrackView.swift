//
//  HorseTrackView.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation
import SwiftUI

struct HorseTrackView: View {
    
    @Binding var isRunning: Bool
    
    let horse: Horse
    let offset: CGFloat

    var body: some View {
        ZStack(alignment: .bottom) {
            Image("back")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .opacity(0.7)
            AnimatedHorseView(
                frameNames: horse.imageFrames,
                speed: horse.speed,
                offset: offset,
                isRunning: $isRunning
            )
        }
    }
}

// MARK: - MOCK Preview
//#Preview {
//    HorseTrackView(
//        isRunning: .constant(true),
//        horse: Horse(
//            name: "Беттер",
//            imageFrames: ["Horse-Frame1", "Horse-Frame2", "Horse-Frame3"],
//            speed: 3.0
//        ),
//        offset: 50
//    )
//}
