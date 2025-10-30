# Django + Flutter example

Este repositório contém dois subprojetos de exemplo:

- `backend_django/`: projeto Django com Django REST Framework e CORS configurados. Expõe `/api/items/`.
- `frontend_flutter/`: app Flutter simples que consome a API e permite listar/criar itens.

Como rodar backend:

```bash
cd backend_django
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py runserver 127.0.0.1:8000
```

Como rodar frontend (Android emulator):

```bash
cd frontend_flutter
flutter pub get
flutter run
```

Observações:
- Use `10.0.2.2` no Flutter para alcançar `127.0.0.1` quando executar em um AVD Android.
- Para gerar APK release:

```bash
cd frontend_flutter
flutter build apk --release
```

CI build (GitHub Actions)
-------------------------

Se você não tem o Flutter SDK localmente, criei um workflow GitHub Actions que gera o APK automaticamente quando você enviar (push) para o branch `main` ou `master`.

1. Commit e push deste repositório para um repositório GitHub.
2. Acesse a aba Actions no repositório e execute o workflow ou aguarde o push.
3. Quando finalizado, baixe o artefato `app-release-apk` que conterá `app-release.apk`.

