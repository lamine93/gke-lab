FROM python:3.11-slim

# Étape 2 : répertoire de travail
WORKDIR /app

# Étape 3 : installer les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

ENV PORT=8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
