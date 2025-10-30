Networking notes for Flutter <-> Django local development

- Android Studio AVD: use http://10.0.2.2:8000 to reach host machine's localhost.
- Genymotion emulator: use http://10.0.3.2:8000.
- Physical device: use your machine IP (e.g., http://192.168.1.10:8000) and ensure firewall allows connections.

If you prefer to use 127.0.0.1 inside Flutter directly (desktop testing), change `apiBase` in `lib/home_page.dart`.
