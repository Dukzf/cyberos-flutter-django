#!/bin/bash

# Configurações do banco de dados
DB_NAME="cyberos_db"
DB_USER="postgres"
DB_PASSWORD="postgres"
DB_HOST="localhost"
BACKUP_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")/backups"
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${TIMESTAMP}.sql"

# Criar diretório de backups se não existir
mkdir -p "$BACKUP_DIR"

# Realizar o backup
echo "Iniciando backup do banco de dados $DB_NAME..."
PGPASSWORD=$DB_PASSWORD pg_dump -h $DB_HOST -U $DB_USER -d $DB_NAME -f "$BACKUP_FILE"

# Verificar se o backup foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "Backup concluído com sucesso: $BACKUP_FILE"
  echo "Tamanho do arquivo: $(du -h "$BACKUP_FILE" | cut -f1)"
else
  echo "Erro ao criar o backup. Verifique as credenciais e tente novamente."
  exit 1
fi

# Criar um arquivo de instruções para restauração
cat > "${BACKUP_DIR}/instrucoes_restauracao.txt" << EOL
Para restaurar este backup em outro servidor, siga estas instruções:

1. Crie um banco de dados vazio:
   createdb -U postgres ${DB_NAME}

2. Restaure o backup:
   PGPASSWORD=sua_senha psql -h localhost -U postgres -d ${DB_NAME} -f arquivo_de_backup.sql

3. Certifique-se de que o arquivo settings.py está configurado corretamente:
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.postgresql',
           'NAME': '${DB_NAME}',
           'USER': 'postgres',  # Ajuste se necessário
           'PASSWORD': 'postgres',  # Ajuste se necessário
           'HOST': 'localhost',
           'PORT': '5432',
       }
   }
EOL

echo "Instruções de restauração foram salvas em ${BACKUP_DIR}/instrucoes_restauracao.txt" 