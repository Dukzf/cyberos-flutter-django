# frontend_flutter

App Flutter simples que consome a API Django local.

Como rodar:

1. Instale dependências:

```bash
flutter pub get
```

2. Rode no emulador Android (recomendado usar AVD do Android Studio):

```bash
flutter run
```

Observação de rede:
- Em emuladores Android use `http://10.0.2.2:8000` para acessar o host local (127.0.0.1 do computador).
- Em emuladores que suportam loopback direto ou em desktops use `http://127.0.0.1:8000`.

Gerar APK release:

```bash
flutter build apk --release
```
