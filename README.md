# device_tracker_SwiftUI

A SwiftUI app combining real-time **location/device tracking with chat**, backed by Firebase — think "Find My Friends" with built-in messaging.

## Features

- Firebase Authentication (sign up, log in, edit profile)
- Live location sharing via a dedicated GPS button and view model
- One-to-one conversations with a custom chat UI (bubbles, message input, conversation list)
- Online/status selector and user settings

## Tech stack

Swift · SwiftUI · Firebase Auth · MVVM · Core Location

## Project structure

```
device_tracker_SwiftUI/
├── Firebase/        # Auth view model
├── navigation/       # ViewRouter
└── useCases/
    ├── login/         # Login flow
    ├── register/       # Registration flow
    └── mainTab/
        ├── GPSButton/    # Live location sharing
        ├── conversations/ # Chat list & chat view
        └── settings/      # Profile, status selector
```
