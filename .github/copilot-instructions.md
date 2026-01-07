# Copilot instructions for instagram_clone_app

Purpose: give AI coding agents immediate, practical context to be productive in this Flutter app.

- **Project type:** Flutter mobile app (multi-platform folders present: `android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/`). Entrypoint: `lib/main.dart`.
- **Dart SDK:** specified in `pubspec.yaml` (sdk ^3.10.4). Null-safety enabled.
- **Linting / style:** `analysis_options.yaml` and `flutter_lints` are used — follow existing lints.

Quick workflows (use from repo root):

- Fetch deps: `flutter pub get`
- Run app (device/emulator): `flutter run` (or `flutter run -d <deviceId>`). On Windows the workspace path contains spaces — quote paths when using shell commands.
- Run tests: `flutter test` (the repo includes `test/widget_test.dart`).
- Build APK: `flutter build apk` or use Android Gradle wrapper: `android\gradlew.bat assembleDebug` (Windows).
- iOS builds require macOS / Xcode: use `flutter build ios` or open `ios/Runner.xcworkspace` in Xcode.

Important files and patterns to reference when editing:

- `lib/main.dart` — app entrypoint; uses `MaterialApp` and theme via `lib/utils/colors.dart`.
- `lib/utils/colors.dart` — centralized color constants (e.g. `mobileBackgroundColor`, `blueColor`). Use these constants for theming to remain consistent.
- `pubspec.yaml` — dependencies, `publish_to: 'none'`, and Flutter config. Add assets/fonts here when needed.
- `analysis_options.yaml` — project lint rules; conform to them when adding code.
- `android/` — Android project uses Gradle Kotlin DSL (`*.kts`) in top-level and app `build.gradle.kts`.
- `ios/Runner` — iOS app in Swift; generated plugin registrant files are present.

Project-specific conventions and useful reminders:

- The codebase is minimal/starter scaffolding. Prefer small, focused changes and add tests when adding behavior.
- Theme and UI constants live in `lib/utils/` — prefer adding new shared UI constants there rather than scattering literals.
- There is currently no state-management package. If introducing one, update `pubspec.yaml`, add a short migration note in a new README section, and add a basic example page under `lib/`.
- Android build files use Kotlin DSL (`.kts`) — when modifying Gradle scripts follow Kotlin DSL patterns rather than Groovy.

Integration points and platform considerations:

- Plugins are wired via the generated plugin registrant files under platform folders; avoid hand-editing those generated files.
- iOS: `Runner/Runner-Bridging-Header.h` and Swift `AppDelegate.swift` exist — careful when adding Obj-C interop.

If merging or editing this file:

- Preserve any existing guidance already in `.github/copilot-instructions.md` if present; only add facts that are discoverable from code.

Examples to cite in PRs or prompts:

- "Follow the theme constants in `lib/utils/colors.dart` for any color additions." 
- "Run `flutter test` — the repo includes `test/widget_test.dart` as a baseline." 

If anything here is unclear or you want more detail (e.g., preferred state-management, CI commands, or platform targets), tell me which area to expand.
