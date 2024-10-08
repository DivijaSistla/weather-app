# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables (optional)
ENV FLASK_APP=app.py

# Expose the port on which the app will run
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
