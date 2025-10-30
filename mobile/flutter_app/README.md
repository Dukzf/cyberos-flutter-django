CyberOS Mobile (Flutter) - quick start
=====================================

This is a minimal Flutter companion app for the CyberOS project.

Prerequisites
- Flutter SDK installed (stable channel)
- A running CyberOS backend (Django) accessible from the device/emulator

Run locally
1. Update the API base URL if your backend is not on http://localhost:8000: edit `lib/services/api_service.dart` and change the `baseUrl` values.
2. Fetch packages:

```bash
cd mobile/flutter_app
flutter pub get
```

3. Run on emulator or device:

```bash
flutter run
```

Notes
- The app uses JWT authentication against `/api/token/` and stores tokens in secure storage.
- Screens implemented: Login, Home, Orders list, Create Order (basic), Technicians map (uses OpenStreetMap tiles).
- Customize and extend the API client in `lib/services/api_service.dart`.

Security
- In production ensure HTTPS and proper CORS settings on the backend.
