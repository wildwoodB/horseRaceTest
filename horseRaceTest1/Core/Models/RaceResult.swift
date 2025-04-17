//
//  RaceResult.swift
//  horseRaceTest1
//
//  Created by Никита Борисов on 17/4/25.
//

import Foundation

struct RaceResult: Identifiable, Codable {
    let id = UUID()
    let date: String
    let winnerName: String
    
    enum CodingKeys: String, CodingKey {
        case date, winnerName
    }
}
