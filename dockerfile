FROM python:3.10-slim

WORKDIR /app

COPY . .

COPY app/main.py .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8503

HEALTHCHECK CMD curl --fail http://localhost:8503/_stcore/health

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8503", "--server.address=0.0.0.0"]