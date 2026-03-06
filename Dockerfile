# Base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY flask_app.py .

# Copy database init script
COPY init.sql .

# Copy static files
COPY static ./static

# Expose port
EXPOSE 8000

# Run the app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "flask_app:app"]