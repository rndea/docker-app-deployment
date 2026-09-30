FROM python:3.12-slim

WORKDIR /app

COPY src/app.py .

EXPOSE 8080

CMD ["python3", "app.py"]
