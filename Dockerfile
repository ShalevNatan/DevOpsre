# Use a lightweight Python image as the base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents to the container
COPY . .

# Install any dependencies (empty requirements file for simplicity)
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose a port (e.g., 8000 for this example)
EXPOSE 8000

# Set the default command to run a simple HTTP server
CMD ["python", "-m", "http.server", "8000"]
