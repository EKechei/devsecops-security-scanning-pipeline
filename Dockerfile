# Build stage: use Python slim image to install dependencies
FROM python:3.9-slim AS builder

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies into a separate directory
COPY requirements.txt .
RUN pip install --upgrade pip --no-cache-dir \
    && pip install --no-cache-dir -r requirements.txt --target=/install

# Copy application code
COPY app/ ./app/

# Runtime stage: use Python Distroless image
FROM gcr.io/distroless/python3:3.9

# Set working directory
WORKDIR /app

# Copy installed Python packages from builder
COPY --from=builder /install /usr/local/lib/python3.9/site-packages

# Copy application code
COPY --from=builder /app /app

# Expose the port your app uses
EXPOSE 8080

# Run the application
CMD ["python3", "app/app.py"]
