//
//  AnimatedHorseView.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import SwiftUI

struct AnimatedHorseView: View {
    
    let frameNames: [String]
    let speed: Double
    let offset: CGFloat
    
    @Binding var isRunning: Bool
    @State private var currentFrameIndex = 0
    
    private var frameInterval: Double {
        max(0.1, speed / Double(frameNames.count * 4))
    }
    
    var body: some View {
        Image(frameNames[currentFrameIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .offset(x: offset)
            .onAppear {
                if isRunning {
                    animateFrames()
                }
            }
            .onChange(of: isRunning) { newValue in
                if newValue {
                    animateFrames()
                }
            }
    }
    
    private func animateFrames() {
        guard isRunning else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + frameInterval) {
            if isRunning {
                withAnimation(.none) {
                    currentFrameIndex = (currentFrameIndex + 1) % frameNames.count
                }
                animateFrames()
            }
        }
    }
}
