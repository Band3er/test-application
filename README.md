# Test Application

A simple Flutter test application that demonstrates user interaction with screen taps and dynamic color generation.

## Features

-   Displays the text *Hello there* in the center of the screen.
-   When tapping anywhere on the screen:
    -   The background color changes to a new color generated from the tap coordinates (RGB).
    -   The generated color is shown in hexadecimal format.
-   Keeps a color history.
- You can revert to the previous color using the back arrow button in the app bar.

## How it works

The app calculates RGB values based on tap down coordinates (dx, dy):
-   $red = dx \bmod 256$
-   $green = dy \bmod 256$
-   $blue = (dx \times dy) \bmod 256$

These values create a new background color, stored in the history. The last color in history is always the background color.

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

## Demo Video

https://github.com/user-attachments/assets/c7872da5-c413-4906-be8d-bd3fd224fe3d
