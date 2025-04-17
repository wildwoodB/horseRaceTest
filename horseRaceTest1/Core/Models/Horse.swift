//
//  HorseModel.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation

struct Horse: Identifiable {
    let id = UUID()
    let name: String
    let imageFrames: [String]
    let speed: Double
}

