# backend_django

Projeto Django mínimo com Django REST Framework e CORS configurados para desenvolvimento local.

Como rodar (local):

1. Crie e ative um virtualenv:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. Instale dependências:

```bash
pip install -r requirements.txt
```

3. Aplique migrações e rode o servidor:

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py runserver 127.0.0.1:8000
```

O endpoint da API estará disponível em `http://127.0.0.1:8000/api/items/`.
