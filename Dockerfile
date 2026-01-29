# Use a slim Python image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install build tools required for compiling Python packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install them
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install required Python packages
RUN pip install flask torch torchvision pillow

# Copy the application code and model file
COPY apps.py apps.py
COPY fasterrcnn_model.pkl fasterrcnn_model.pkl

# Expose the port
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=apps.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
