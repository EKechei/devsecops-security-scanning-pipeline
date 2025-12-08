FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Update OS packages and install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY app/ ./app/

# Expose port
EXPOSE 8080

# Run application
CMD ["python", "app/app.py"]
