# Virtual Membership Card

A Flutter mobile application that displays a virtual membership card with a dynamically generated QR code. Built with modern Flutter architecture using Riverpod for state management and go_router for navigation.

## Features

- **Dynamic QR Code**: Generates QR codes based on user ID with timestamp for uniqueness
- **Refresh Functionality**: Updates QR code with new timestamp on button press
- **Mobile Optimized**: Responsive design that works great on all mobile devices
- **Modern Architecture**: Built with Riverpod for state management and go_router for navigation

## Tech Stack

- **Flutter**: Cross-platform mobile development framework
- **Riverpod**: State management solution
- **go_router**: Declarative routing
- **qr_flutter**: QR code generation library

## Screenshots


https://github.com/user-attachments/assets/36c9ba8a-bbfd-4405-868d-f6c97a23d74d


## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/virtual-membership-card.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Key Components

### QR Code Provider
- Uses Riverpod's `StateNotifier` to manage QR code data
- Generates unique codes by appending timestamps
- Handles state updates when refresh button is pressed

### Membership Card Widget
- Displays user information (Alex Ray, Platinum Member)
- Shows profile picture placeholder
- Renders dynamic QR code

### Main Screen
- Integrates all components
- Handles refresh button interactions
- Shows current QR code data for debugging

## How It Works

1. **Initial Load**: App generates QR code with base user ID: `user-id-12345-abcde`
2. **Refresh Action**: Button press triggers QR code regeneration with timestamp: `user-id-12345-abcde-{timestamp}`
3. **State Management**: Riverpod manages QR code state across the app
4. **UI Updates**: Widget automatically rebuilds when QR code data changes

