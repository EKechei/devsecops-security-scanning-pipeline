# Build stage: use Python 3.12 Alpine image to install dependencies
FROM python:3.12.12-alpine3.23 AS builder

# Install build dependencies for Python packages
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies into a separate directory
COPY requirements.txt .
RUN pip install --upgrade pip --no-cache-dir \
    && pip install --no-cache-dir -r requirements.txt --target=/install

# Copy application code
COPY app/ ./app/

# Runtime stage: use Python 3.12 Distroless image
FROM gcr.io/distroless/python3:3.12

# Set working directory
WORKDIR /app

# Copy installed Python packages from builder
COPY --from=builder /install /usr/local/lib/python3.12/site-packages

# Copy application code
COPY --from=builder /app /app

# Expose the port your app uses
EXPOSE 8080

# Run the application
CMD ["app/app.py"]
