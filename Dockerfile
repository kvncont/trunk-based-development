FROM python:3.13-alpine

COPY app/ /app

WORKDIR /app

CMD ["python", "main.py"]