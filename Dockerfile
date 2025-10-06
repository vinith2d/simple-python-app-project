# Use Python 3.11 base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .

#Install the project dependicies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application
COPY . .

# Expose Flask's default port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
