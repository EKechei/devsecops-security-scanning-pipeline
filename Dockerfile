# Build stage
FROM python:3.11-alpine AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Runtime stage - Python slim is already minimal
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY app/ .
EXPOSE 8080
CMD ["python", "app.py"]
