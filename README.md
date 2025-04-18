# Horse Race Game

A simple racing simulation game built with SwiftUI featuring animated horses.

## Features

- Animated horse racing with frame-by-frame animation
- Random race generation with varying horse speeds
- Race history tracking with persistence
- Tab-based UI with race and history views

## Architecture

This project follows MVVM architecture:

- **Models**: Horse, RaceResult
- **ViewModels**: HorseRaceViewModel, RaceResultViewModel
- **Services**: RaceTimerService, StorageService

## Project Structure

```
horseRaceTest1/
├── Models/
│   ├── Horse.swift
│   └── RaceResult.swift
├── Views/
│   ├── ContentView.swift
│   ├── HorseRaceView.swift
│   ├── RaceResultView.swift
│   ├── HorseTrackView.swift
│   └── AnimatedHorseView.swift
├── ViewModels/
│   ├── HorseRaceViewModel.swift
│   └── RaceResultViewModel.swift
├── Services/
│   ├── StorageService.swift
│   └── RaceTimerService.swift
└── Utilities/
    └── HorseRaceConfig.swift
```

## Technical Stack

- SwiftUI for UI implementation
- Combine for reactive programming
- Async/Await for race timing
- UserDefaults for data persistence
- Custom animation implementation

## Getting Started

1. Clone the repository
2. Open in Xcode 14.0+
3. Build and run on iOS 15.0+

## Author

Никита Борисов
