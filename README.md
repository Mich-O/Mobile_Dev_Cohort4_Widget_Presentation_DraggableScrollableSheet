# Flutter Music Player UI — 'DraggableScrollableSheet' widget

### DraggableScrollableSheet - A Flutter widget that creates a draggable, resizable panel with scrollable content

## Overview

The interface features a music player with a song-list panel anchored at the bottom of the screen. Users can drag the panel to adjust its height and scroll through the available songs.

## Features

- **Expandable playlist panel:** Drag the panel up or down to adjust its height.
- **Scrollable song list:** Browse songs using `ListView.builder`.
- **Adjustable panel size:** Configure the initial, minimum, and maximum heights.
- **Custom drag handle:** Interact with the panel using a dedicated handle.
- **Layered interface:** Display the playlist over the music-player interface.
- **Styled layout:** Use backgrounds, spacing, and rounded corners to organize the interface.

## Built With

- [Flutter](https://flutter.dev/) — UI development framework.
- [Dart](https://dart.dev/) — Programming language used by Flutter.

## Flutter Widgets Demonstrated

| Widget | Purpose |
|---|---|
| `Scaffold` | Provides the basic structure of the screen. |
| `Stack` | Allows the music player and playlist panel to overlap. |
| `Container` | Provides layout, spacing, background styling, and rounded corners. |
| `DraggableScrollableSheet` | Creates the expandable, draggable playlist panel. |
| `ListView.builder` | Builds the scrollable list of songs as needed. |
| `GestureDetector` | Detects drag gestures on the custom handle. |
| `DraggableScrollableController` | Allows the code to control the sheet's size. |
| `SafeArea` | Helps keep interface content clear of system interface areas. |

## How the Draggable Sheet Works

The playlist panel is configured using three main properties:

```dart
DraggableScrollableSheet(
  initialChildSize: 0.30,
  minChildSize: 0.20,
  maxChildSize: 0.50,
  builder: (context, scrollController) {
    return ListView.builder(
      controller: scrollController,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(songs[index]),
        );
      },
    );
  },
)
```

The snippet illustrates the core configuration; the complete application includes the surrounding layout and styling.

| Property | Value | Description |
|---|---:|---|
| `initialChildSize` | `0.30` | The panel starts at 30% of the available height. |
| `minChildSize` | `0.20` | The panel can shrink to 20%. |
| `maxChildSize` | `0.50` | The panel can expand to 50%. |

These values are fractions of the available height, rather than fixed pixel measurements.

### Coordinating Dragging and Scrolling

The sheet provides a `scrollController` to its builder. Passing this controller to the `ListView.builder` allows Flutter to coordinate resizing the panel with scrolling its contents.

The application also uses a drag handle for resizing the sheet directly through gesture detection and a `DraggableScrollableController`.

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK
- Dart SDK (included with Flutter)
- Android Studio, VS Code, or another supported development environment
- An Android emulator, iOS simulator, or compatible physical device

See the [official Flutter installation guide](https://docs.flutter.dev/get-started/install) if you need help setting up your environment.

### Installation

**1. Clone the repository**

```bash
git clone https://github.com:Mich-O/Mobile_Dev_Cohort4_Widget_Presentation_DraggableScrollableSheet.git
```



**2. Navigate to the project directory**

```bash
cd Mobile_Dev_Cohort4_Widget_Presentation_DraggableScrollableSheet/
```

## Project Structure

The Flutter project structure looks like this:


```text
Mobile_Dev_Cohort4_Widget_Presentation_DraggableScrollableSheet/
├── android/                         # Android platform files
├── ios/                             # iOS platform files
├── linux/                           # Linux platform files
├── macos/                           # macOS platform files
├── web/                             # Web platform files
├── windows/                         # Windows platform files
├── lib/
│   └── main.dart                    # Main application and UI implementation
├── test/                            # Automated tests
├── screenshots/                     # Application screenshots
├── build/                           # Generated build output (not committed)
├── .dart_tool/                      # Generated Dart tooling files (not committed)
├── .idea/                           # IDE configuration (not committed)
├── .gitignore                       # Git exclusion rules
├── .metadata                        # Flutter project metadata
├── analysis_options.yaml             # Dart static analysis configuration
├── pubspec.yaml                     # Project configuration and dependencies
├── pubspec.lock                     # Locked dependency versions
├── draggable_scrollable_sheet_widget_1.iml  # IDE module file
├── README.md                        # Project documentation
└── main.py                          # Currently empty Python file
```

### Key Files and Directories

- **`lib/main.dart`** — Contains the main Flutter application, including the music-player interface and draggable playlist panel.
- **`screenshots/`** — Stores screenshots demonstrating the application.
- **`test/`** — Contains automated tests for the application.
- **`pubspec.yaml`** — Defines project metadata, dependencies, and Flutter assets.
- **`pubspec.lock`** — Records the resolved dependency versions.
- **`analysis_options.yaml`** — Configures Dart code analysis and lint rules.
- **`.gitignore`** — Specifies files and directories Git should ignore.
- **Platform directories** — Contain the files needed to run or build the application for Android, iOS, desktop, and web.
- **`README.md`** — Provides project information, setup instructions, and testing guidance.



## Testing the Application

You can test the application manually using a Flutter emulator or a connected device.

### 1. Run the application

Open a terminal in the project directory and run:

```bash
flutter pub get
flutter run
```

Wait for the application to build and launch.

### 2. Verify the interface

Check that:

- The music-player interface displays correctly.
- The song-list panel appears at the bottom of the screen.
- The panel has a visible drag handle.
- The song list displays the expected song items.

### 3. Test the draggable panel

Perform the following actions:

1. **Drag upward:** Drag the panel's handle upward and verify that the panel expands.
2. **Check the maximum size:** Continue dragging until the panel reaches its maximum height.
3. **Scroll the playlist:** Scroll through the song list and verify that additional songs can be viewed.
4. **Drag downward:** Pull the panel down and verify that it shrinks.
5. **Check the minimum size:** Verify that the panel does not shrink below its configured minimum height.

### 4. Verify layout behavior

- Confirm that the playlist panel appears over the music-player interface.
- Check that the panel's rounded corners and styling display correctly.
- Verify that the song list remains usable when the panel is expanded.
- Confirm that the panel and its contents remain visible and usable on the target device's screen size.

### Expected Result

The application should launch without errors, display the music-player interface, and allow the playlist panel to expand and shrink within its configured size limits. The song list should scroll correctly, with dragging and scrolling coordinated as intended.

### Troubleshooting

If the application fails to launch or behaves unexpectedly, run:

```bash
flutter analyze
flutter test
```

Review any reported errors, correct the underlying issues, and run the application again.


You can also open the project in VS Code or Android Studio and launch it on a connected device or emulator.


## Author

**https://github.com/Mich-O**


## License

This project is available for educational and personal learning purposes.
