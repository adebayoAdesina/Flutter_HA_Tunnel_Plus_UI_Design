# HA Tunnel Plus UI Design

A Flutter UI design of the HA Tunnel Plus app. This is a UI-only project: it
does not create real tunnels or connections.

> This is an independent design exercise and is not affiliated with or
> endorsed by the original HA Tunnel Plus app.

## Features

- Responsive layout (phone and tablet)
- Home screen with server, port and connection mode controls
- Settings page (notifications, connection and tunnel options)
- Light, Dark and System themes, remembered between launches
- "Follow me on GitHub" dialog on launch

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- An Android device or emulator

### Run the app

```bash
git clone https://github.com/adebayoAdesina/Flutter_HA_Tunnel_Plus_UI_Design.git
cd Flutter_HA_Tunnel_Plus_UI_Design
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── Color/            # App color constants
├── Responsiveness/   # Phone / tablet switch
├── Screen/           # Top-level screens (mobile, tablet, settings)
├── Theme/            # Light/dark themes and theme persistence
├── Views/Mobile/     # Home and log tabs
└── Widget/           # Shared widgets and constants
```

## Contributing

Contributions are welcome!

1. **Fork** the repository on GitHub.
2. **Clone** your fork and create a branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and check them before committing:
   ```bash
   flutter analyze
   flutter test
   ```
4. **Commit** with a clear message:
   ```bash
   git commit -m "Add short description of your change"
   ```
5. **Push** your branch and open a **Pull Request** against `main`, describing
   what you changed and why. Include screenshots for UI changes.

For bugs or ideas, please open an
[issue](https://github.com/adebayoAdesina/Flutter_HA_Tunnel_Plus_UI_Design/issues)
first so we can discuss it.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE)
file for details.
