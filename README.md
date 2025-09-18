# Test Application

A simple Flutter test application that demonstrates user interaction with screen taps and dynamic color generation.

## Features

- Displays the text *Hello there* in the center of the screen.
- When tapping anywhere on the screen:
  - It generates a random background color (full 16,777,216 RGB colors).
  - The generated color is shown in hexadecimal format.
- Stores a color history that can be revisited via a floating action button.
- You can revert to the previous color using the back arrow button in the app bar.
- Tap a color in the history to reapply it as the background.

## How it works

The app generates colors randomly using `dart:math`:

```dart
final int colorInt = Random().nextInt(1 << 24);
final int red = (colorInt >> 16) & 0xFF;
final int green = (colorInt >> 8) & 0xFF;
final int blue = colorInt & 0xFF;
final Color newColor = Color.fromARGB(0xFF, red, green, blue);
```

Each generated color is stored in a history list and the last color in the history is displayed as the current background.

## Installation & Run

1. Clone the repository:

```bash
git clone https://github.com/Band3er/test-application.git
cd test-application
```

2. Get dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

It uses the package [solid_lints](https://pub.dev/packages/solid_lints) for static code analysis.
